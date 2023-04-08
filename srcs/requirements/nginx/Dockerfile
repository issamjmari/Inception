FROM debian:buster
RUN apt-get update -y && apt-get install nginx openssl vim -y
COPY nginxScript/script.sh /script.sh
RUN chmod +x /script.sh
COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
EXPOSE 443
CMD ["/script.sh"]