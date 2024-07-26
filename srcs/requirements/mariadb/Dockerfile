FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y mariadb-server

# Copy custom configuration files
COPY conf/my.cnf /etc/mysql/my.cnf

# Copy initialization script
COPY tools/init.sql /docker-entrypoint-initdb.d/init.sql

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Expose the MySQL port
EXPOSE 3306

# Start MySQL service
CMD ["mysqld"]
