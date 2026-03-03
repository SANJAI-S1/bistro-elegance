# Step 1: Build the Java web app using Maven
FROM maven:3.9.9-eclipse-temurin-21-jammy AS BUILD_IMAGE

# Clone the repository
RUN git clone https://github.com/SANJAI-S1/bistro-elegance.git

# Checkout to the 'docker' branch and build the WAR file
RUN cd bistro-elegance && git checkout main && mvn install

FROM tomcat:10-jdk21

# Remove the default Nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

COPY --from=build_image \
bistro-elegance/target/bistro-elegance-1.0.0.war \
/usr/local/tomcat/webapps/ROOT.war

# Expose port 80 for Nginx to serve content
EXPOSE 8080

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
