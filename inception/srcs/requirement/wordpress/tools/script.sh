#!/bin/bash

wp core download --allow-root
wp config create --dbhost=mariadb --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBKEY --allow-root
wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMINKEY --admin_email=$ADMINEMAIL --allow-root
wp user create $USER $USEREMAIL --role=subscriber --user_pass=$USERKEY --allow-root

sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F -R --nodaemonize