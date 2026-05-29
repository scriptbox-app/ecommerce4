#!/usr/bin/env bash
# Run ecommerce4 with PHP 7.4 (required for Laravel 7 in this project)
cd "$(dirname "$0")"
PORT="${PORT:-8004}"
fuser -k "${PORT}/tcp" 2>/dev/null || true
# CLI runs as your user — use a writable view cache (Apache should NOT set this; it uses storage/)
export VIEW_COMPILED_PATH="${TMPDIR:-/tmp}/ecommerce4-views-cli"
mkdir -p "$VIEW_COMPILED_PATH"
chmod 777 "$VIEW_COMPILED_PATH" 2>/dev/null || true
exec /usr/bin/php74 -S "127.0.0.1:${PORT}" index.php
