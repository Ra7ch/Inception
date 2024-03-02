#!/bin/bash


sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

until [ -f ./wp-config.php ] 
do
    sleep 1 
done

chmod -R 777 .
chown -R www-data:www-data .

wp config set WP_CACHE true --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
# wp plugin install redis-cache --activate --allow-root

touch redis.enabled.bck

exec redis-server --protected-mode no