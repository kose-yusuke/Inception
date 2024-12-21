#!/bin/bash

set -eux

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

if [ -f /run/secrets/credentials ]; then
  source /run/secrets/credentials
else
  echo "Error: /run/secrets/credentials not found"
  exit 1
fi

if [ ! -f wp-config.php ]; then
  if [ -d wp-admin ] && [ -f wp-includes/version.php ]; then
    echo "WordPress file already exist. Skipping core download"
  else
    ./wp-cli.phar core download --allow-root
  fi

  if [ ! -f wp-config.php ]; then
    ./wp-cli.phar config create \
      --dbname="$DB_NAME" \
      --dbuser="$DB_USER" \
      --dbpass="$DB_PASS" \
      --dbhost="$DB_HOST" \
      --allow-root
  else
    echo "wp-config.php already exists. Skipping config creation."
  fi
fi

if ! ./wp-cli.phar core is-installed --allow-root; then
  ./wp-cli.phar core install --url="$DOMAIN_NAME" --title=inception --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --allow-root
else
  echo "WordPress is already installed. Skipping core installation."
fi

if ! ./wp-cli.phar user get "$USER_NAME" --allow-root > /dev/null 2>&1; then
  ./wp-cli.phar user create "$USER_NAME" "$USER_EMAIL" --role=editor --user_pass="$USER_PASSWORD" --allow-root
else
  echo "User $USER_NAME already exists. Skipping user creation."
fi

php-fpm8.2 -F