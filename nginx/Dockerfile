FROM	debian:buster

RUN	apt update && apt upgrade && apt install nginx -y && apt install vim -y \
	&& apt install curl -y


# RUN	mkdir -p /etc/nginx/ssl && apt update && apt install openssl -y \
# 	&& openssl req -x509 -nodes -out /etc/nginx/ssl/Nginx.crt -keyout /etc/nginx/ssl/Nginx.key\
# 	-subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=raitmous.42.fr/UID=raitmous"

RUN apt-get update && apt-get upgrade -y \
    && mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/Nginx.crt -keyout /etc/nginx/ssl/Nginx.key -subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=raitmous.42.fr/UID=raitmous"
    #&& apt-get install -y nginx vim curl openssl \


#COPY	def /etc/nginx/nginx.conf
COPY    ./confi/nginx.conf /etc/nginx/conf.d/localhost.conf

# Expose HTTP and HTTPS ports
EXPOSE 800 443
RUN	chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

#RUN	mv /var/www/html/* /var/www/html/index.html

CMD	["nginx", "-g", "daemon off;"]


#############################
# FROM alpine:3.14

# RUN apk update && apk upgrade && apk add nginx vim curl openssl

# # Create SSL directory and generate self-signed certificate
# RUN mkdir -p /etc/nginx/ssl && \
#     openssl req -x509 -nodes -out /etc/nginx/ssl/Nginx.crt -keyout /etc/nginx/ssl/Nginx.key -subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=raitmous.42.fr/UID=raitmous"

# # Copy Nginx configuration
# RUN rm -rf /etc/nginx/http.d/*
# COPY ./confi/nginx.conf /etc/nginx/http.d/localhost.conf

# # Expose HTTP and HTTPS ports
# EXPOSE 80 443

# # Create the directory for Nginx
# RUN mkdir -p /var/www/html && \
#     chmod 755 /var/www/html && \
#     adduser -D -u 1000 -g 'www' www && \
#     chown -R www:www /var/lib/nginx

# CMD ["nginx", "-g", "daemon off;"]

