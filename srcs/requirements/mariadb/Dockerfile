FROM debian:buster
RUN apt-get update -y && apt-get install telnet mariadb-server vim -y
RUN mkdir -p /scr && service mysql start && chown -R mysql: /scr
COPY mariaScript/script.sh /scr/script.sh
RUN chmod +x /scr/script.sh
WORKDIR /scr
USER mysql
CMD ["/scr/script.sh"]