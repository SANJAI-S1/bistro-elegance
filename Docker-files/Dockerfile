# Step 1: Build the Java web app using Maven
FROM maven:3.9.9-eclipse-temurin-21-jammy AS BUILD_IMAGE

# Clone the repository
RUN git clone https://github.com/SANJAI-S1/bistro-elegance.git

# Checkout to the 'docker' branch and build the WAR file
RUN cd bistro-elegance && git checkout main && mvn install

# Step 2: Serve the WAR file using Nginx
FROM nginx:alpine

# Remove the default Nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

# Copy the generated WAR file from the build image into the Nginx directory
# Nginx does not natively support WAR, so we will treat it as a static file
COPY --from=BUILD_IMAGE bistro-elegance/target/bistro-elegance-1.0.0.war /usr/share/nginx/html/ROOT.war

# Expose port 80 for Nginx to serve content
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
