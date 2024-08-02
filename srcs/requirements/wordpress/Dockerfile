# srcs/requirements/wordpress/Dockerfile

FROM debian:bullseye

# Met à jour et installe les paquets nécessaires
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql wget default-mysql-client curl && \
    mkdir -p /run/php && mkdir -p /var/www/html

# Installe WP-CLI (outil en ligne de commande pour WordPress)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Télécharge et installe WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html && \
    rm -rf latest.tar.gz wordpress

# Liste le contenu du répertoire de configuration php-fpm pour vérifier les chemins
RUN ls -la /etc/php/7.4/fpm/

# Copie le fichier de configuration personnalisé www.conf pour php-fpm
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copie le script de configuration runWordPress.sh
COPY tools/runWordPress.sh /runWordPress.sh

# Modifie la configuration php.ini et www.conf pour php-fpm
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.4/fpm/php.ini && \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
    chmod +x /runWordPress.sh

# Port pour PHP-FPM
EXPOSE 9000

# Commande par défaut pour lancer le script runWordPress.sh
CMD ["/runWordPress.sh"]
