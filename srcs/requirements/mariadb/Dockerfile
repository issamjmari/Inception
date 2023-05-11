FROM debian:buster
WORKDIR /scr
RUN apt-get update -y && apt-get install telnet mariadb-server vim -y

COPY mariaScript/script.sh /scr/script.sh
COPY mariaScript/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /scr/script.sh
CMD ["/scr/script.sh"]