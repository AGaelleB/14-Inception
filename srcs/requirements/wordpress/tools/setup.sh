#!/bin/bash

# Fonction pour vérifier si MariaDB est prêt
function check_mariadb() {
  mysql -h"${WORDPRESS_DB_HOST}" -u"${WORDPRESS_DB_USER}" -p"${WORDPRESS_DB_PASSWORD}" -e "SHOW DATABASES;" > /dev/null 2>&1
}

# Attendre que MariaDB soit prêt
echo "Vérification de la disponibilité de MariaDB..."
while ! check_mariadb; do
    echo "En attente que MariaDB soit prêt..."
    sleep 5
done

echo "MariaDB est prêt !"

# Changer de répertoire pour le répertoire d'installation de WordPress
cd /var/www/html

# Vérifier si le fichier wp-config.php existe pour déterminer si WordPress est installé
if [ -f wp-config.php ]; then
    echo "WordPress est déjà installé."
else
    # Configurer WordPress
    echo "Création du fichier wp-config.php..."
    wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --allow-root

    # Installer WordPress
    echo "Installation de WordPress..."
    wp core install --url="${DOMAIN_NAME}" --title="Titre de Votre Blog" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
fi

# Démarrer PHP-FPM
echo "Démarrage de PHP-FPM..."
php-fpm7.4 -F
