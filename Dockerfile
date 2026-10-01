# Use a tiny, extremely fast web server called NGINX
FROM nginx:alpine

# Copy our website files into the web server's public folder
COPY index.html /usr/share/nginx/html/
