FROM debian:11-slim


RUN apt update -y
RUN apt install wget -y && wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64
RUN mv cadvisor-v0.47.2-linux-amd64 cadvisor && chmod +x cadvisor


CMD ["./cadvisor", "--port=808"]