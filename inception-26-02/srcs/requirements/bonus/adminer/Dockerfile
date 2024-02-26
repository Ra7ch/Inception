FROM debian:11-slim

RUN apt update -y && apt install php7.4 php7.4-cli php7.4-mysql wget -y

WORKDIR /var/www/html

RUN wget https://www.adminer.org/latest.php -O index.php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
