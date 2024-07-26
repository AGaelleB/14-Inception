FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    mkdir -p /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/ && \
    rm -rf latest.tar.gz wordpress

# List the contents of the php-fpm configuration directory to verify paths
RUN ls -la /etc/php/7.4/fpm/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.4/fpm/php.ini && \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;listen.mode = 0660/listen.mode = 0660/g' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.4/fpm/php-fpm.conf

EXPOSE 9000

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD ["/setup.sh", "php-fpm7.4", "-F"]



