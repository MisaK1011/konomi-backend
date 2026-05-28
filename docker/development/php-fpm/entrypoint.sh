#!/bin/sh
set -e

if [ -z "$(ls -A /var/www/storage 2>/dev/null)" ]; then
    echo "Initializing storage directory..."
    cp -r /var/www/storage-init/. /var/www/storage/
fi

php artisan config:clear
php artisan view:clear

exec "$@"
