# Use the official NGINX image built specifically for non-root security
FROM nginxinc/nginx-unprivileged:alpine

# Copy our website files into the web server's public folder
COPY index.html /usr/share/nginx/html/

# Explicitly switch to the non-root user to satisfy the security scanner
USER nginx
