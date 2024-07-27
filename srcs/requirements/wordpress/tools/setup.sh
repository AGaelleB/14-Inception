#!/bin/bash

# Function to check if MariaDB is ready
function check_mariadb() {
  mysql -h"${WORDPRESS_DB_HOST}" -u"${WORDPRESS_DB_USER}" -p"${WORDPRESS_DB_PASSWORD}" -e "SHOW DATABASES;" > /dev/null 2>&1
}

# Wait for MariaDB to be ready
echo "Checking MariaDB readiness..."
while ! check_mariadb; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

echo "MariaDB is ready!"

# Change to the WordPress installation directory
cd /var/www/html

# Check if WordPress is already installed
if wp core is-installed --allow-root; then
    echo "WordPress is already installed."
else
    # Download WordPress if not already present
    if [ ! -f wp-config.php ]; then
        echo "Downloading WordPress..."
        wp core download --allow-root
    fi

    # Configure WordPress
    if [ ! -f wp-config.php ]; then
        echo "Creating wp-config.php..."
        wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --allow-root
    fi

    # Install WordPress
    echo "Installing WordPress..."
    wp core install --url="${DOMAIN_NAME}" --title="Your Blog Title" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
fi

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm7.4 -F
