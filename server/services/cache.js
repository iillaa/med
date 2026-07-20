const state = {
  catsCache: [],
  suggestionsCache: [],
  pdfIndex: [],
  adminPasswordHash: '',
  adminPasswordSalt: '',
  remoteServerUrl: '',
  activeTokens: new Map(),
  searchCache: new Map(),
  endpointTimings: new Map(),
  pdfParseTimes: [],
  writePhaseDurations: { backup: [], write: [], rename: [] },
  cacheHits: 0,
  cacheMisses: 0
};

globalThis.perfServer = {
  recordRequest(path, method, duration, status) {
    const key = `${method} ${path}`;
    if (!state.endpointTimings.has(key)) {
      state.endpointTimings.set(key, { samples: [], errors: 0 });
    }
    const data = state.endpointTimings.get(key);
    data.samples.push(duration);
    if (data.samples.length > 100) {
      data.samples.shift();
    }
    if (status >= 400) {
      data.errors++;
    }
  },
  recordPdfParse(file, duration, pages) {
    state.pdfParseTimes.push({ file, duration, pages });
    if (state.pdfParseTimes.length > 200) {
      state.pdfParseTimes.shift();
    }
  },
  recordWrite(phases) {
    if (phases.backup !== undefined) {
      state.writePhaseDurations.backup.push(phases.backup);
      if (state.writePhaseDurations.backup.length > 100) state.writePhaseDurations.backup.shift();
    }
    if (phases.write !== undefined) {
      state.writePhaseDurations.write.push(phases.write);
      if (state.writePhaseDurations.write.length > 100) state.writePhaseDurations.write.shift();
    }
    if (phases.rename !== undefined) {
      state.writePhaseDurations.rename.push(phases.rename);
      if (state.writePhaseDurations.rename.length > 100) state.writePhaseDurations.rename.shift();
    }
  },
  recordCacheHit() {
    state.cacheHits++;
  },
  recordCacheMiss() {
    state.cacheMisses++;
  }
};

module.exports = { state };
