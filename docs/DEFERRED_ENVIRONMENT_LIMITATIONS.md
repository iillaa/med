# 📌 Deferred Environment & Infrastructure Constraints (TODO Log)

This document tracks known operational limitations associated with hosting Dr. CAT on physical Android devices via **Termux** and **Free Ngrok Tunnels**. These items are recognized constraints of the local Termux environment and are documented for future Cloud VPS deployment.

---

## 1. Termux on Android 12+ (Phantom Process Killer & OOM Management)
- **Constraint**: Android 12+ enforces the *Phantom Process Killer* and aggressive Doze mode power management. When memory pressure rises or the device screen remains locked for extended periods, the Android OS may kill the Termux Node.js server process.
- **Current Mitigation**: `termux-wake-lock` and persistent Termux background notification.
- **Future Resolution**: Migrate central backend deployment to a dedicated Cloud VPS (e.g. Hetzner, AWS, DigitalOcean) with a static SSL domain once self-hosting on device is transitioned to cloud.

---

## 2. Free Ngrok Tunnel Limits (*.ngrok-free.dev)
- **Constraint**: Free Ngrok tunnels enforce rate limits, connection limits, and dynamic URL rotations whenever the tunnel reconnects.
- **Current Mitigation**: Auto-syncing `remote_server_config.json` and build-baked `remote_config.js` with client fallback to offline bundled JSON.
- **Future Resolution**: Replace Ngrok with a permanent custom domain (e.g. `api.drcat.app`) with static Cloudflare Tunnel or direct Nginx reverse proxy.

---

## 3. Total Network Failover Latency (4s × 3 = 12s)
- **Constraint**: 4000ms timeout × 3 consecutive failures equals 12s of total network wait before client fallback to local bundled database occurs on remote failure.
- **Current Mitigation**: Single-provider mode bypasses rotation logic; local offline bundle loaded instantly on Capacitor APK startup.
- **Future Resolution**: Reduce reachability ping to 2000ms once connected to low-latency cloud infrastructure.
