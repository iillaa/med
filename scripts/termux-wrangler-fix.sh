#!/usr/bin/env bash
# Termux/Android fix: workerd has no android-arm64 binary, which crashes ALL
# wrangler commands (even --version). The native binary is only needed for
# `wrangler dev`, never for whoami/secret put/deploy. Re-run this after any
# npm install that reinstalls workerd.
#
# Usage:  bash scripts/termux-wrangler-fix.sh
MAIN="node_modules/workerd/lib/main.js"
if [ ! -f "$MAIN" ]; then
  echo "workerd not installed — nothing to do."
  exit 0
fi
if grep -q "termux-shim" "$MAIN"; then
  echo "workerd already patched."
  exit 0
fi
perl -0pi -e 's/function generateBinPath\(\) \{\n  const \{ pkg, subpath \} = pkgAndSubpathForCurrentPlatform\(\);/function generateBinPath() {\n  return "\/nonexistent\/workerd-termux-shim";\n  const { pkg, subpath } = pkgAndSubpathForCurrentPlatform();/' "$MAIN"
grep -q "termux-shim" "$MAIN" && echo "Patched workerd for Termux (wrangler non-dev commands now work)." || { echo "Patch failed — inspect $MAIN"; exit 1; }
