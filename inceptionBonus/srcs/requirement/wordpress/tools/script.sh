#!/bin/bash

wp core download --allow-root
#wp config create --dbhost=mariadb --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBKEY 
wp config create --dbhost=mariadb --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBKEY --allow-root --extra-php <<PHP
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_CACHE', true);
PHP
wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMINKEY --admin_email=$ADMINEMAIL --allow-root
wp user create $USER $USEREMAIL --role=subscriber --user_pass=$USERKEY --allow-root

sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

chown -R www-data:www-data /var/www/html/
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

php-fpm7.4 -F -R --nodaemonize