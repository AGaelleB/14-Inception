#!/bin/bash

# Changer de répertoire pour le répertoire d'installation de WordPress
cd /var/www/html

# Vérifier si le fichier wp-config.php existe pour déterminer si WordPress est déjà installé
if [ -f wp-config.php ]; then
    echo "WordPress is already installed."
else
    echo "Creating wp-config.php file"
    wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --allow-root
    
    if [ $? -ne 0 ]; then
        echo "Error creating wp-config.php file"
        exit 1
    fi

    # Installation de WordPress
    echo "Installing WordPress"
    wp core install --url="${DOMAIN_NAME}" --title="Your Blog Title" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
    
    if [ $? -ne 0 ]; then
        echo "Error installing WordPress"
        exit 1
    fi
fi

# Vérif et créer le répertoire wp-content/uploads s'il n'existe pas
if [ ! -d wp-content/uploads ]; then
    echo "Creating wp-content/uploads directory"
    mkdir -p wp-content/uploads
fi

# Définir les perm du répertoire uploads
echo "Setting permissions and ownership for wp-content/uploads directory"
chown -R www-data:www-data wp-content/uploads
chmod -R 755 wp-content/uploads

chown -R www-data:www-data /var/www/html/wp-content
chmod -R 755 /var/www/html/wp-content

# Start PHP-FPM
echo "Starting PHP-FPM"
php-fpm7.4 -F
