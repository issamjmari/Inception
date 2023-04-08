#!/bin/sh
mkdir -p /var/www/html
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
chown www-data:www-data * */*

mv ./wp-config-sample.php ./wp-config.php
# sed -i -r "s/'database_name_here'/'mariadb'/1" wp-config.php
# sed -i -r "s/'username_here'/'issam'/1" wp-config.php
# sed -i -r "s/'password_here'/'issam123'/1" wp-config.php
# sed -i -r "s/localhost/mariadb/1"    wp-config.php

wp core install --url="localhost" --title="Example" --admin_user="admin" --admin_password="password" --admin_email="admin@example.com" --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir /run/php
/usr/sbin/php-fpm7.3 -F