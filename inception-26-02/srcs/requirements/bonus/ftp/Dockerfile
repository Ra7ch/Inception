FROM debian:11-slim

RUN apt-get update && apt-get install -y vsftpd wget php7.4

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN chmod +x /usr/local/bin/wp

COPY tools/ftp.sh /bin/ftp.sh

RUN chmod +x /bin/ftp.sh

CMD [ "sh", "/bin/ftp.sh" ]