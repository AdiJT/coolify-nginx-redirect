# Use the official Nginx image as a base
FROM nginx:latest

# Copy the custom Nginx configuration file to the container
COPY default.conf /etc/nginx/conf.d/default.conf