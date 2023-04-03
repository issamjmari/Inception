FROM debian:buster
RUN apt-get update -y && apt-get install nginx openssl vim -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MO//L=BN/O=1337/OU=Student/CN=ijmari.42.fr/UID=ijmari"
COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]