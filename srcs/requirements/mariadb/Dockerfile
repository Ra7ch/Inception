FROM debian:11-slim

RUN apt update -y && apt upgrade && apt install mariadb-server -y

COPY tools/mariadb.sh /bin/

RUN chmod +x /bin/mariadb.sh

CMD [ "/bin/mariadb.sh" ]
