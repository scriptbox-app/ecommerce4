#!/usr/bin/env bash
# Run once with sudo so Apache (www-data) and your user can both use the app:
#   sudo bash fix-permissions.sh

set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"

chown -R www:www "$ROOT/project/storage" "$ROOT/project/bootstrap/cache"
chmod -R 775 "$ROOT/project/storage" "$ROOT/project/bootstrap/cache"

# Remove custom /tmp view path — Apache must use storage/framework/views
sed -i '/^VIEW_COMPILED_PATH=/d' "$ROOT/project/.env"

# Use project/.env everywhere
ln -sf "$ROOT/project/.env" "$ROOT/project/vendor/markury/src/.env"

# Recommended Apache config (replaces root .htaccess if you approve)
if [ -f "$ROOT/htaccess.recommended" ]; then
  cp "$ROOT/htaccess.recommended" "$ROOT/.htaccess"
fi

# Load .env from project/ (Laravel default); remove legacy markury env path if present
sed -i "s|useEnvironmentPath([^)]*)|useEnvironmentPath(realpath(__DIR__.'/..'))|" "$ROOT/project/bootstrap/app.php"

# After storage is writable, prefer file cache/sessions (edit project/.env if needed):
# CACHE_DRIVER=file
# SESSION_DRIVER=file
# LOG_CHANNEL=single

echo "Done. Restart Apache/PHP-FPM and open your site."
