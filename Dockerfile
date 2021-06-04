# syntax=docker/dockerfile:1

FROM maven:3.6.3-openjdk-8 as builder
WORKDIR /work
COPY build.sh pom.xml src/ webapp/ /work/
WORKDIR /tmp
COPY build.sh .
RUN ./build.sh

RUN ls /work/target/


FROM ghcr.io/jhu-sheridan-libraries/lutece-init:0.8
COPY --from=builder /work/target/stfrancis-lutece-site*.war /data/lutece.war
RUN ls -lah /data
