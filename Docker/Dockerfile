FROM debian:12.11

WORKDIR /local_bind

RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && echo "UTC" > /etc/timezone
RUN apt update && apt install -y \
    iperf3 \
    net-tools \
    iputils-ping
RUN apt-get clean && rm -rf /var/lib/apt/lists/*




