FROM debian:bullseye

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the web server port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
