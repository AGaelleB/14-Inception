# srcs/requirements/nginx/Dockerfile

FROM debian:bullseye

# Install Nginx
RUN apt-get update && \
    apt-get upgrade &&\
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL certificate and key
COPY ssl/nginx.crt /etc/nginx/ssl/nginx.crt
COPY ssl/nginx.key /etc/nginx/ssl/nginx.key

# Expose port 443 for HTTPS
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]



