#!/bin/sh

service mysql restart
echo "CREATE DATABASE IF NOT EXISTS wp_database ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'issam'@'%' IDENTIFIED BY '1234' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'issam'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql
mysqld_safe