#!/bin/bash

# Démarrer MariaDB
mysqld_safe --datadir='/var/lib/mysql' &

# Attendre que le serveur soit prêt
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 1
done

# Exécuter les configurations initiales
echo "MariaDB is ready. Executing initial setup..."
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# Continuer à exécuter MariaDB au premier plan
wait
