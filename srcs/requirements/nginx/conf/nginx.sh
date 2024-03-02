#!/bin/bash

openssl req -x509 -nodes -out $CERT_PATH -keyout $CERT_KEY_PATH -subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=$DOMAIN_NAME_42/UID=raitmous"

echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name $DOMAIN_NAME_42 $DOMAIN_NAME_1337;

    ssl_certificate $CERT_PATH;
    ssl_certificate_key $CERT_KEY_PATH; " > /etc/nginx/sites-enabled/default

echo '   ssl_protocols TLSv1.3 TLSv1.2;

    index index.php index.html index.htm;
    root /var/www/html;

    location ~ [^/]\.php(/|$) {
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}' >> /etc/nginx/sites-enabled/default

exec nginx -g "daemon off;"