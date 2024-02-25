FROM debian:11-slim

RUN apt update -y && apt upgrade -y && apt install redis-server wget php7.4-redis php7.4-mysql  -y

COPY ./tools/redis.sh /bin/redis.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
RUN chmod +x /usr/local/bin/wp
RUN chmod +x /bin/redis.sh

CMD ["sh", "/bin/redis.sh"]