FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y iputils-ping snmp procps lm-sensors curl vim wget telnet && \
    rm -rf /var/lib/apt/lists/*

ENV TELEGRAF_VERSION 1.14.3

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    dpkg -i telegraf_${TELEGRAF_VERSION}-1_amd64.deb && \
    rm telegraf_${TELEGRAF_VERSION}-1_amd64.deb

EXPOSE 8125/udp 8092/udp 8094

CMD ["telegraf"]
