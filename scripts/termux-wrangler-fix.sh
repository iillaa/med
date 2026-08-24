#!/usr/bin/env bash
# Termux/Android fix: workerd has no android-arm64 binary, which crashes ALL
# wrangler commands (even --version). The native binary is only needed for
# `wrangler dev`, never for whoami/secret put/deploy.
#
# Runs AUTOMATICALLY after every `npm install` via the package.json
# `postinstall` hook. Safe everywhere: exits 0 without patching when either
# (a) workerd is not installed, (b) already patched, or (c) NOT running on a
# Termux/Android device (CI and normal machines keep their real workerd).
#
# Manual fallback:  bash scripts/termux-wrangler-fix.sh

# Guard 1: only ever patch inside a Termux/Android environment.
if [ ! -e /data/data/com.termux ] && [ -z "$TERMUX_VERSION" ]; then
  exit 0
fi

MAIN="node_modules/workerd/lib/main.js"
if [ ! -f "$MAIN" ]; then
  echo "[termux-wrangler-fix] workerd not installed — nothing to do."
  exit 0
fi
if grep -q "termux-shim" "$MAIN"; then
  echo "[termux-wrangler-fix] workerd already patched."
  exit 0
fi
perl -0pi -e 's/function generateBinPath\(\) \{\n  const \{ pkg, subpath \} = pkgAndSubpathForCurrentPlatform\(\);/function generateBinPath() {\n  return "\/nonexistent\/workerd-termux-shim";\n  const { pkg, subpath } = pkgAndSubpathForCurrentPlatform();/' "$MAIN"
if grep -q "termux-shim" "$MAIN"; then
  echo "[termux-wrangler-fix] Patched workerd for Termux (wrangler non-dev commands now work)."
else
  echo "[termux-wrangler-fix] Patch failed — inspect $MAIN" >&2
  # Never fail the npm install over an operator convenience tool.
  exit 0
fi
