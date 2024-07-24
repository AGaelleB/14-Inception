FROM debian:bullseye

# Install necessary packages for WordPress
RUN apt-get update && \
    apt-get install -y apache2 php php-mysql wget && \
    rm -rf /var/lib/apt/lists/*

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/ && \
    rm -rf latest.tar.gz wordpress

# Expose the web server port
EXPOSE 80

# Start Apache
CMD ["apachectl", "-D", "FOREGROUND"]
