FROM debian:buster

RUN apt-get update -y && apt-get install curl php-fpm php-mysql -y

RUN mkdir -p /var/www/html

RUN cd /var/www/html

RUN rm -rf *
 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar 
 
RUN mv wp-cli.phar /usr/local/bin/wp
 
RUN wp core download --allow-root
 
RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

RUN sed -i -r "s/database/$db_name/1"   wp-config.php

RUN sed -i -r "s/database_user/$db_user/1"  wp-config.php

RUN sed -i -r "s/passwod/$db_pwd/1"    wp-config.php

RUN sed -i -r "s/localhost/mariadb/1"    wp-config.php

RUN wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

RUN wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

RUN /usr/sbin/php-fpm7.3 -F