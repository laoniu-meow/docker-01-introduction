# Step 1: Use the ultra-lightweigh Alpine Linux image
FROM nginx:alpine

# Step 2: Copy project to Nginx's public folder
COPY index.html /usr/share/nginx/html/index.html

# Step 3: Expose port 80 to allow web traffic
EXPOSE 80

# Step 4: Run Nginx
CMD ["nginx", "-g", "daemon off;"]
