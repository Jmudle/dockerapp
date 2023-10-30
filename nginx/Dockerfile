# Use the official NGINX image as the base image
FROM nginx:latest

# Copy your custom nginx.conf to the NGINX configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (NGINX default)
EXPOSE 80

# Start NGINX when the container starts
CMD ["nginx", "-g", "daemon off;"]


