#!/bin/sh

# Fix permissions for WordPress directory
chown -R www-data:www-data /var/www/html/

# Move wp-config.php if it does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
   mv /tmp/wp-config.php /var/www/html/
fi

# Wait for services to be ready
sleep 10

# Install WordPress if not already installed
if ! wp --allow-root --path="/var/www/html/" core is-installed; then
   wp --allow-root --path="/var/www/html/" core install \
       --url=$WP_URL \
       --title=$WP_TITLE \
       --admin_user=$WP_ADMIN_USER \
       --admin_password=$WP_ADMIN_PASSWORD \
       --admin_email=$WP_ADMIN_EMAIL
fi

# Create WordPress user if not exists
if ! wp --allow-root --path="/var/www/html/" user get $WP_USER; then
   wp --allow-root --path="/var/www/html/" user create \
       $WP_USER \
       $WP_EMAIL \
       --user_pass=$WP_PASSWORD \
       --role=$WP_ROLE
fi

# Execute the given command
exec $@