FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY /var/www/html/2148_bistro_elegance/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
