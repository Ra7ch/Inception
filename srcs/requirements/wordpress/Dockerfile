FROM debian:11-slim

RUN apt update -y && apt upgrade -y && apt -y install php7.4 php7.4-fpm php7.4-mysql wget 

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY tools/wordpress.sh /bin/

WORKDIR /var/www/html

RUN mkdir -p /var/run/php && \
    chmod 755 /var/run/php && \
    chown www-data:www-data /var/run/php

RUN chmod +x /bin/wordpress.sh
RUN chmod +x /usr/local/bin/wp

CMD [ "/bin/wordpress.sh" ]
