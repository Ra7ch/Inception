FROM	debian:buster

RUN	apt update && apt upgrade && apt install nginx -y && apt install vim -y \
	&& apt install curl -y

RUN apt-get update && apt-get upgrade -y \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/Nginx.crt -keyout /etc/nginx/ssl/Nginx.key -subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=raitmous.42.fr/UID=raitmous"

COPY    ./conf/nginx.conf /etc/nginx/conf.d/localhost.conf

EXPOSE 443

RUN	chmod 777 /var/www/html && chown -R www-data:www-data /var/www/html

CMD	["nginx", "-g", "daemon off;"]