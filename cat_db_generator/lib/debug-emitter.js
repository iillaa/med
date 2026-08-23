/**
 * Real-Time Telemetry & Debug Stream Emitter for Dr.CAT V3 Generator
 * Singleton EventEmitter broadcasting structured events to Server-Sent Events (SSE) clients.
 */

const { EventEmitter } = require('events');

class DebugEmitter extends EventEmitter {
  constructor() {
    super();
    this.setMaxListeners(50);
    this.eventBuffer = [];
    this.maxBufferSize = 300;
    this.sseClients = new Set();
    this.maxSSEClients = 20;
  }

  /**
   * Broadcasts a typed debug event to all connected SSE clients and memory buffer
   * @param {string} type - Event category/name
   * @param {object} payload - Structured event data
   */
  emitEvent(type, payload = {}) {
    const event = {
      id: `${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
      timestamp: new Date().toISOString(),
      type,
      payload
    };

    // Keep rolling memory buffer
    this.eventBuffer.push(event);
    if (this.eventBuffer.length > this.maxBufferSize) {
      this.eventBuffer.shift();
    }

    // Emit to Node event listeners
    this.emit('debug_event', event);

    // Stream to active SSE clients
    const sseData = `data: ${JSON.stringify(event)}\n\n`;
    for (const client of this.sseClients) {
      try {
        client.write(sseData);
      } catch (err) {
        this.sseClients.delete(client);
      }
    }

    return event;
  }

  /**
   * Registers a new Express response as an SSE client
   * @returns {boolean} false when the concurrent client cap is reached (caller should reject)
   */
  addSSEClient(res) {
    if (this.sseClients.size >= this.maxSSEClients) {
      return false;
    }
    this.sseClients.add(res);

    // Send initial handshake
    const handshake = {
      id: `init_${Date.now()}`,
      timestamp: new Date().toISOString(),
      type: 'sse_connected',
      payload: {
        message: 'Telemetry SSE stream established.',
        activeClients: this.sseClients.size,
        bufferedCount: this.eventBuffer.length
      }
    };
    res.write(`data: ${JSON.stringify(handshake)}\n\n`);

    // Clean up when client disconnects
    res.on('close', () => {
      this.sseClients.delete(res);
    });
  }

  /**
   * Returns recent events from memory buffer
   */
  getRecentLogs(limit = 100) {
    const lim = Math.min(Number(limit) || 100, this.maxBufferSize);
    return this.eventBuffer.slice(-lim);
  }

  /**
   * Clears the event buffer
   */
  clearLogs() {
    this.eventBuffer = [];
    this.emitEvent('logs_cleared', { message: 'Debug logs buffer cleared by admin.' });
    return { success: true, count: 0 };
  }
}

// Global Singleton Instance
const debugEmitter = new DebugEmitter();

module.exports = debugEmitter;
