#!/bin/sh

cat << EOF > /etc/mysql/my.cnf
[mysqld]
user = root
port = 3306
socket = /var/run/mysqld/mysqld.sock
bind-address = 0.0.0.0
EOF
mysql_install_db #--user=mysql --datadir=/var/lib/mysql

service mysql start
echo "CREATE DATABASE IF NOT EXISTS wp_database ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'issam'@'%' IDENTIFIED BY '1234' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'issam'@'%' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql
mysql < db1.sql
service mysql stop
exec mysqld
# /etc/mysql/mariadb.conf.d