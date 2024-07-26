#!/bin/bash

# Wait for MariaDB to be ready
while ! mysqladmin ping -h"${WORDPRESS_DB_HOST}" --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 20
done

# Change to the WordPress installation directory
cd /var/www/html

# Download WordPress if not already present
if [ ! -f wp-config.php ]; then
    wp core download --allow-root
fi

# Configure WordPress
if [ ! -f wp-config.php ]; then
    wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --allow-root
fi

# Install WordPress
if ! $(wp core is-installed --allow-root); then
    wp core install --url="${DOMAIN_NAME}" --title="Your Blog Title" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
fi

# Start PHP-FPM
php-fpm7.4 -F
