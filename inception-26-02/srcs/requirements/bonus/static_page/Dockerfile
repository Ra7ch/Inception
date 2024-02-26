FROM    debian:11-slim

RUN     apt update -y && apt upgrade -y && apt-get install -y php7.4-cli \
    && rm -rf /var/lib/apt/lists/*

WORKDIR  /var/www/html

RUN mkdir tools

COPY    ./tools/ ./tools

RUN    mv ./tools/*.html ./index.html

CMD ["php", "-S", "0.0.0.0:8000"]