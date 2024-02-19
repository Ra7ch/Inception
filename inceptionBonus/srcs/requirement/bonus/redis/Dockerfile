FROM    debian:11

RUN     apt update -y && apt upgrade -y && apt install redis-server -y


COPY ./tools/redis.sh /tmp/redis.sh

# RUN echo "maxmemory 128MB" >> /etc/redis/redis.conf 

# RUN echo "maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf

# RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

# RUN echo "define( 'WP_REDIS_HOST', 'redis' );\
#     define( 'WP_REDIS_PORT', 6379 );\
#     define('WP_CACHE', true);" >> /var/www/html/wp-config.php
# RUN chown -R www-data:www-data /var/www/html/
# RUN find /var/www/html -type d -exec chmod 755 {} \;
# RUN find /var/www/html -type f -exec chmod 644 {} \;

CMD ["sh", "/tmp/redis.sh"]