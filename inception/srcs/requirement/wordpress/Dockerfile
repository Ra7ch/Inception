FROM debian:11

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php7.4 php7.4-fpm wget unzip php7.4-mysql

WORKDIR /var/www/html

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY    tools/script.sh /bin

RUN     chmod +x /bin/script.sh

RUN mkdir -p /run/php/

# Clean up unnecessary packages and files
RUN apt-get remove -y unzip wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/php && \
    chmod 755 /var/run/php && \
    chown www-data:www-data /var/run/php

CMD [ "/bin/script.sh" ]