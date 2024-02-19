FROM debian:buster


RUN apt -y update 

COPY ./tools/adminer.sh /

RUN apt install wget -y && apt install php php-mysql  -y

RUN chmod +x /adminer.sh
CMD ["/adminer.sh"]