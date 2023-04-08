FROM debian:buster
RUN apt-get update -y && apt-get install curl php-fpm php-mysql vim -y
COPY wordpress/script.sh /script.sh
RUN chmod +x /script.sh
CMD ["/script.sh"]