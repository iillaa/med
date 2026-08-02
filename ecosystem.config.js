module.exports = {
  apps: [{
    name: 'drcat',
    script: 'server.js',
    cwd: '/data/data/com.termux/files/home/med',
    watch: false,
    max_memory_restart: '200M',
    restart_delay: 3000,
    max_restarts: 10,
    min_uptime: '5s',
    // Log config — PM2 logrotate will use these paths
    out_file: '/data/data/com.termux/files/home/med/logs/server-out.log',
    error_file: '/data/data/com.termux/files/home/med/logs/server-err.log',
    merge_logs: false,
    log_date_format: 'YYYY-MM-DD HH:mm:ss',
    env: {
      NODE_ENV: 'production',
      PORT: 3000
    }
  }]
};
