# srcs/requirements/wordpress/Dockerfile

# Use the Debian Bullseye base image
FROM debian:bullseye

# Install necessary packages for WordPress
RUN apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y \
     php-fpm \
     php-mysql \
     wget && \
 rm -rf /var/lib/apt/lists/*

# Create directory for PHP-FPM socket
RUN mkdir -p /run/php

# Create directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
 tar -xzf latest.tar.gz && \
 mv wordpress/* /var/www/html/ && \
 chown -R www-data:www-data /var/www/html/ && \
 rm -rf latest.tar.gz wordpress

# Set ARG for PHP path
ARG PHPPATH=/etc/php/7.4/fpm

# Copy the PHP-FPM configuration file
COPY conf/www.conf ${PHPPATH}/pool.d/www.conf

# Modify php.ini and www.conf
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' ${PHPPATH}/php.ini && \
    sed -i "s/listen = \/run\/php\/php$PHP_VERSION-fpm.sock/listen = 9000/g" ${PHPPATH}/pool.d/www.conf && \
    sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' ${PHPPATH}/pool.d/www.conf && \
    sed -i 's/;daemonize = yes/daemonize = no/g' ${PHPPATH}/pool.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM in the foreground
CMD ["php-fpm7.4", "-F"]


