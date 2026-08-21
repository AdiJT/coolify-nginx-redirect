# Use the official Nginx image as a base
FROM nginx:latest

USER root

# Adding wget to the container, so we can run Coolify's Healthcheck
RUN apt update \
  && apt install -y wget \
  && rm -rf /var/lib/apt/lists/*

# Copy the custom Nginx configuration file to the container
COPY default.conf /etc/nginx/conf.d/nginx-template.conf
RUN ["/bin/sh", "-c", "/etc/nginx/conf.d/nginx-template.conf > /etc/nginx/nginx.conf"]

EXPOSE 80

USER www-data

CMD ["/bin/sh", "-c", "/etc/nginx/conf.d/nginx-template.conf > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]