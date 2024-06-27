# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Install Node.js to build Tailwind CSS
RUN apk add --update nodejs npm

# Create a directory for the app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package.json ./
COPY package-lock.json* ./

# Install project dependencies
RUN npm install

# Copy the Tailwind configuration and input CSS
COPY tailwind.config.js ./
COPY styles/input.css ./styles/

# Build the Tailwind CSS
RUN npx tailwindcss -i ./styles/input.css -o ./dist/output.css --minify

# Copy the built CSS and other static files to the Nginx directory
COPY dist /usr/share/nginx/html/dist
COPY index.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY script.js /usr/share/nginx/html/
COPY snipcart.js /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]