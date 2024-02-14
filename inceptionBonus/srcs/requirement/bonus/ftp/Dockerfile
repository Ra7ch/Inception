FROM debian:11

RUN apt update -y && apt upgrade -y && apt install vsftpd -y

COPY ./tools/ftp.sh /bin/ftp.sh

CMD ["sh", "/bin/ftp.sh"]