FROM debian:stretch as builder

# Install ant, unzip, java, and a mysql client
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y mysql-client unzip default-jdk ant git --no-install-recommends

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
