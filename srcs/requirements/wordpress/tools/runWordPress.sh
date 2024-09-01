#!/bin/bash

# Change directory to the WordPress installation directory
cd /var/www/html

# Check if the wp-config.php file exists to determine if WordPress is already installed
if [ -f wp-config.php ]; then
    echo "WordPress is already installed."
else
    echo "Creating wp-config.php file..."
    wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --allow-root
    
    if [ $? -ne 0 ]; then
        echo "Error creating wp-config.php file"
        exit 1
    fi

    # Install WordPress
    echo "Installing WordPress..."
    wp core install --url="${DOMAIN_NAME}" --title="Your Blog Title" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
    
    if [ $? -ne 0 ]; then
        echo "Error installing WordPress"
        exit 1
    fi
fi

# Check and create the wp-content/uploads directory if it doesn't exist
if [ ! -d wp-content/uploads ]; then
    echo "Creating wp-content/uploads directory..."
    mkdir -p wp-content/uploads
fi

# Set permissions and ownership for the uploads directory
echo "Setting permissions and ownership for wp-content/uploads directory..."
chown -R www-data:www-data wp-content/uploads
chmod -R 755 wp-content/uploads

chown -R www-data:www-data /var/www/html/wp-content
chmod -R 755 /var/www/html/wp-content

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm7.4 -F
