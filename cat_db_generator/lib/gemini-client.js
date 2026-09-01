/**
 * Gemini API Client
 * Handles HTTP requests to Google AI Studio, multi-model fallback,
 * exponential backoff, rate-limit pauses (HTTP 429), and telemetry logging.
 */

const { discoverDynamicModels, applyModelBlocklist } = require('./model-registry');
const debugEmitter = require('./debug-emitter');

async function callLLMApi(systemPrompt, userPrompt, options = {}) {
  const apiKey = options.apiKey || process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  if (!apiKey) {
    throw new Error('LLM API Key missing! Set GOOGLE_API_KEY or GEMINI_API_KEY in .env');
  }

  // Discover highest dynamic active models from Google API
  const dynamicModels = await discoverDynamicModels(apiKey);
  let modelsToTry = options.model ? [options.model, ...dynamicModels] : dynamicModels;
  modelsToTry = applyModelBlocklist(modelsToTry);
  if (modelsToTry.length === 0) {
    throw new Error('GEMINI_BLOCKLIST a filtré tous les modèles disponibles. Vérifier la variable GEMINI_BLOCKLIST dans .env.');
  }
  let lastError = null;

  for (const model of modelsToTry) {
    const startTime = Date.now();
    let res = null;
    let rateLimitAttempts = 0;

    debugEmitter.emitEvent('llm_model_attempt', {
      model,
      attemptNumber: rateLimitAttempts + 1,
      totalModelsAvailable: modelsToTry.length
    });

    while (rateLimitAttempts < 3) {
      rateLimitAttempts++;
      try {
        const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`;

        const generationConfig = {
          temperature: 0.2,
          responseMimeType: 'application/json'
        };

        // Apply thinkingConfig only to full Flash/Pro models — exclude lite variants that don't support it
        if (/gemini-(3|2\.5|2\.0)/i.test(model) && !/lite/i.test(model)) {
          const defaultBudget = /pro/i.test(model) ? 4096 : 2048;
          generationConfig.thinkingConfig = {
            thinkingBudget: options.thinkingBudget || defaultBudget
          };
        }

        const payload = {
          contents: [
            {
              role: 'user',
              parts: [{ text: `${systemPrompt}\n\n--- TASK INPUT ---\n${userPrompt}` }]
            }
          ],
          generationConfig: generationConfig
        };

        // 60-second timeout per request — prevents infinite hang on stalled models
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 60000);
        try {
          res = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload),
            signal: controller.signal
          });
        } finally {
          clearTimeout(timeoutId);
        }

        if (res.status === 429) {
          console.warn(`⚠️ [LLM Rate Limit HTTP 429] Model ${model} rate limited (attempt ${rateLimitAttempts}/3). Pausing 10s to reset quota...`);
          debugEmitter.emitEvent('llm_model_rate_limit', { model, attempt: rateLimitAttempts, cooldownSec: 10 });
          await new Promise(r => setTimeout(r, 10000));
          continue; // Retry same model after 10s cooldown
        }

        if (res) break;
      } catch (netErr) {
        lastError = netErr;
        console.warn(`⚠️ Network fetch attempt ${rateLimitAttempts}/3 for model ${model} failed: ${netErr.message}`);
        debugEmitter.emitEvent('llm_model_fail', { model, attempt: rateLimitAttempts, error: netErr.message });
        if (rateLimitAttempts < 3) await new Promise(r => setTimeout(r, 2000));
      }
    }

    if (!res) continue;

    const latencyMs = Date.now() - startTime;

    if (!res.ok) {
      const errText = await res.text();
      lastError = new Error(`HTTP ${res.status} [${model}]: ${errText.substring(0, 200)}`);
      console.warn(`⚠️ Model ${model} failed with HTTP ${res.status}. Falling back to next model...`);
      debugEmitter.emitEvent('llm_model_fail', { model, httpStatus: res.status, error: lastError.message });
      continue;
    }

    try {
      const data = await res.json();
      const candidate = data.candidates && data.candidates[0];
      if (!candidate || !candidate.content || !candidate.content.parts) {
        lastError = new Error(`Unexpected LLM output format from ${model}`);
        continue;
      }

      const rawText = candidate.content.parts.map(p => p.text).join('\n').trim();

      const usage = data.usageMetadata || {};
      const promptTokens = usage.promptTokenCount || Math.ceil((systemPrompt.length + userPrompt.length) / 4);
      const completionTokens = usage.candidatesTokenCount || Math.ceil(rawText.length / 4);
      const totalTokens = usage.totalTokenCount || (promptTokens + completionTokens);

      const metrics = {
        model: model,
        latencyMs: latencyMs,
        promptTokens: promptTokens,
        completionTokens: completionTokens,
        totalTokens: totalTokens,
        timestamp: new Date().toISOString()
      };

      console.log(`⚡ [LLM API CALL] Model: ${model} | Latency: ${latencyMs}ms | Tokens: ${totalTokens} (${promptTokens} in / ${completionTokens} out)`);

      debugEmitter.emitEvent('llm_response_received', {
        model,
        latencyMs,
        promptTokens,
        completionTokens,
        totalTokens,
        previewSnippet: rawText.slice(0, 300)
      });

      return {
        text: rawText,
        metrics: metrics
      };
    } catch (err) {
      lastError = err;
    }
  }

  throw new Error(`All LLM models failed! Last error: ${lastError ? lastError.message : 'Unknown'}`);
}

module.exports = {
  callLLMApi
};
