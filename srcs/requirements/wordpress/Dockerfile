# srcs/requirements/wordpress/Dockerfile

# Utiliser l'image de base Debian Bullseye
FROM debian:bullseye

# Installer les paquets nécessaires pour WordPress
RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y \ 
        php-fpm \ 
        php-mysql \ 
        wget \ 
        && rm -rf /var/lib/apt/lists/*


# Créer le répertoire pour WordPress
RUN mkdir -p /var/www/html

# Télécharger et extraire WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/ && \ 
    rm -rf latest.tar.gz wordpress

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Démarrer PHP-FPM
CMD ["php-fpm", "-F"]
