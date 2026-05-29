# ecommerce4

Laravel 7 multi-vendor e-commerce application (GeniusOcean / Markury).

## Requirements

- **PHP 7.4** (use `/usr/bin/php74` — PHP 8.2 is not compatible with this Laravel version)
- MySQL 8+ with database `ecommerce4`
- Composer dependencies (already in `project/vendor`)

## Database

Credentials are configured in `project/.env`:

| Setting | Value |
|---------|--------|
| Host | `127.0.0.1` |
| Database | `ecommerce4` |
| Username | `root` |
| Password | *(see `.env`)* |

Schema seed file: `project/database/ecommerce4-seed.sql` (import if tables are missing).

```bash
mysql -u root -p ecommerce4 < project/database/ecommerce4-seed.sql
```

## Run locally

```bash
./run.sh
```

Open **http://127.0.0.1:8004**

- Storefront: `/`
- Admin: `/admin/login` (default admin from seed: `info@creativedesign.com.bd` — use your imported password)

## Apache / Nginx

Point the document root to this repository root (where `index.php` lives). Use **PHP 7.4** FPM. Ensure `project/storage` and `project/bootstrap/cache` are writable by the web server user (`www-data`).

## Fixes applied

1. MySQL connection (`127.0.0.1`, database `ecommerce4`)
2. Imported full schema and demo data
3. Disabled forced HTTPS for local dev (`generalsettings.is_secure = 0`)
4. PHP 7.4 + deprecation handling in `index.php`
5. Writable compiled views via `VIEW_COMPILED_PATH=/tmp/ecommerce4-views` when `storage/` is not writable by your user
