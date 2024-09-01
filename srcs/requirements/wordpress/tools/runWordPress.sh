#!/bin/bash

# Fonction pour vérifier si MariaDB est prêt
function check_mariadb() {
    mysql -h"${WORDPRESS_DB_HOST}" -u"${WORDPRESS_DB_USER}" -p"${WORDPRESS_DB_PASSWORD}" -e "SHOW DATABASES;" > /dev/null 2>&1
}

# Attendre que MariaDB soit prêt
echo "Vérification de la disponibilité de MariaDB..."
while ! check_mariadb; do
    echo "En attente que MariaDB soit prêt..."
    sleep 2
done

echo "MariaDB est prêt !"

# Changer de répertoire pour le répertoire d'installation de WordPress
cd /var/www/html

# Vérifier si le fichier wp-config.php existe pour déterminer si WordPress est installé
if [ -f wp-config.php ]; then
    echo "WordPress est déjà installé."
else
    echo "Création du fichier wp-config.php..."
    wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --allow-root
    
    if [ $? -ne 0 ]; then
        echo "Erreur lors de la création du fichier wp-config.php"
        exit 1
    fi

    # Installer WordPress
    echo "Installation de WordPress..."
    wp core install --url="${DOMAIN_NAME}" --title="Titre de Votre Blog" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
    
    if [ $? -ne 0 ]; then
        echo "Erreur lors de l'installation de WordPress"
        exit 1
    fi
fi

# Vérifier et créer le répertoire wp-content/uploads s'il n'existe pas
if [ ! -d wp-content/uploads ]; then
    echo "Création du répertoire wp-content/uploads..."
    mkdir -p wp-content/uploads
fi

# Fixer les permissions et la propriété du répertoire des téléchargements
echo "Fixation des permissions et de la propriété du répertoire wp-content/uploads..."
chown -R www-data:www-data wp-content/uploads
chmod -R 755 wp-content/uploads

chown -R www-data:www-data /var/www/html/wp-content
chmod -R 755 /var/www/html/wp-content

# Démarrer PHP-FPM
echo "Démarrage de PHP-FPM..."
php-fpm7.4 -F
