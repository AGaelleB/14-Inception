#!/bin/bash

# Ensure the data directory is created and has the correct permissions
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# Step 1: Start MariaDB safely in the background without network access to prevent external connections during initialization.
mysqld_safe --skip-networking &
echo "Starting MariaDB server..."

# Step 2: Wait until MariaDB is ready to accept connections.
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

echo "MariaDB is ready. Running initial SQL script..."

# Step 3: Execute the SQL initialization script.
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" < /docker-entrypoint-initdb.d/init.sql

echo "Initial SQL script executed. MariaDB setup is complete."

# Step 4: Shut down the MariaDB server safely after initialization.
mysqladmin -uroot -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Step 5: Start MariaDB in the foreground to keep the container running.
exec mysqld_safe
