#!/bin/sh

# Créer les répertoires nécessaires et ajuster les permissions
mkdir -p /var/run/mysqld /var/lib/mysql
chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Démarrer le service MariaDB en mode foreground pour voir les logs
service mariadb start

# Attendre que MariaDB soit prêt à accepter des connexions
until mysqladmin ping -u root --silent; do
  echo "MariaDB is starting..."
  sleep 1
done

# Exécuter les commandes SQL pour configurer la base de données et les utilisateurs
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');
EOF

# Exécuter la commande passée en argument du script
exec "$@"
