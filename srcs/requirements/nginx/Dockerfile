FROM debian:11-slim

RUN apt update -y && apt upgrade -y && apt -y install nginx openssl \
        && mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.sh /bin/nginx.sh

RUN  chmod 777 /var/www/html && chown -R www-data:www-data /var/www/html && chmod +x /bin/nginx.sh

CMD [ "sh", "/bin/nginx.sh" ]