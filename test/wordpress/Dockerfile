# FROM	debian:buster

# RUN		apt update -y && apt upgrade -y && apt install php8 php8-fpm php8-cli php8-common php8-imap php8-redis php8-snmp php8-xml php8-mysqli php8-zip php8-mbstring php8-curl -y

# WORKDIR	/var/www/html

# RUN		wget https://wordpress.org/latest.zip \
# 		&& unzip latest.zip \
# 		&& rm latest.zip

# RUN		chown -R www-data:www-data wordpress/ \
# 		&& chmod 0777 wordpress/* && mv wp-config-sample.php wp-config.php
# FROM debian:buster

# # Install required packages
# RUN apt-get update -y && \
#     apt-get upgrade -y && \
#     apt-get install -y \
#         php7.3 php7.3-fpm php7.3-cli php7.3-common php7.3-imap php7.3-redis php7.3-snmp php7.3-xml php7.3-mysql php7.3-zip php7.3-mbstring php7.3-curl \
#         unzip wget

# # Set up the working directory
# WORKDIR /var/www/html

# # Download and extract WordPress
# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && \
#     rm latest.zip

# # Set permissions and configure WordPress
# RUN chown -R www-data:www-data wordpress/ && \
#     chmod -R 0777 wordpress/ && \
#     mv wordpress/wp-config-sample.php wordpress/wp-config.php

# # Clean up unnecessary packages and files
# RUN apt-get remove -y unzip wget && \
#     apt-get autoremove -y && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# # Expose port 9000 for php-fpm
# EXPOSE 9000

# # Start php-fpm
# CMD ["php-fpm7.3", "-F"]


FROM debian:11

# Install required packages

#RUN asdas

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php7.4 php7.4-fpm wget unzip php7.4-mysql
#php7.3-cli php7.3-common php7.3-imap php7.3-redis php7.3-snmp php7.3-xml  php7.3-zip php7.3-mbstring php7.3-curl unzip wget

# Set up the working directory
WORKDIR /var/www/html

# # Download and extract WordPress
# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && \
#     rm latest.zip

# # Set permissions and configure WordPress
# RUN chown -R www-data:www-data wordpress/ && \
#     chmod -R 0777 wordpress/ && \
#     mv wordpress/wp-config-sample.php wordpress/wp-config.php\
#      && mv wordpress/* .

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY    script.sh /bin
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


#RUN	sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

#COPY wp-config.php /var/www/html/wp-config.php

#CMD ["php-fpm7.3", "--nodaemonize"]
#RUN wp redis enable --allow-root

#RUN /usr/sbin/php-fpm7.3 -F

# Remove the EXPOSE 9000 line as it's not needed
# EXPOSE 9000
# Create directory for PID file

# Set PIDFile in the [Service] section of php-fpm.conf
#RUN sed -i 's|^pid = /run/php-fpm/php-fpm.pid|pid = /var/run/php-fpm/php-fpm.pid|' /etc/php/7.3/fpm/php-fpm.conf


# Start php-fpm in the background
#CMD ["sh", "-c", "mkdir -p /run/php/ && php-fpm7.3 --nodaemonize"]
#CMD ["mkdir", "-p", "/run/php/"] && php-fpm7.3 --nodaemonize

#####################################

# FROM alpine:3.14

# # Install required packages
# RUN apk --no-cache add \
#     php8 php8-fpm php8-mysqli php8-mbstring php8-xml \
#     wget unzip

# # Set up the working directory
# WORKDIR /var/www/html

# # Download and extract WordPress
# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && \
#     rm latest.zip

# # Set permissions and configure WordPress
# RUN chown -R nobody:nogroup wordpress/ && \
#     chmod -R 0777 wordpress/ && \
#     mv wordpress/wp-config-sample.php wordpress/wp-config.php && \
#     mv wordpress/* .

# # Clean up unnecessary packages and files
# RUN apk del unzip wget && \
#     rm -rf /var/cache/apk/*

# # Create the directory for PHP-FPM socket
# RUN mkdir -p /var/run/php && \
#     chmod 755 /var/run/php && \
#     chown nobody:nogroup /var/run/php

# # Configure PHP-FPM to listen on port 9000
# RUN sed -i 's|^listen = /run/php/php8-fpm.sock|listen = 9000|' /etc/php8/php-fpm.d/www.conf

# COPY wp-config.php /var/www/html/wp-config.php

# CMD ["php-fpm8", "--nodaemonize"]
