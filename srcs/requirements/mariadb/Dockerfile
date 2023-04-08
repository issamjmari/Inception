FROM debian:buster
RUN apt-get update -y && apt-get install mariadb-server vim -y
RUN service mysql start
COPY script.sh /script.sh
RUN chmod +x /script.sh
CMD ["/script.sh"]