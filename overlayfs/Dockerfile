FROM ubuntu:14.04.1

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget

WORKDIR /dist

RUN \
  mkdir -p opt/cassandra; \
  wget -O - http://www.us.apache.org/dist/cassandra/2.1.2/apache-cassandra-2.1.2-bin.tar.gz \
  | tar xzf - --strip-components=1 -C "opt/cassandra";

RUN rm -rf /dist/opt/cassandra/javadoc

RUN echo ava:x:102:106::/opt/cassandra:/bin/bash >> /etc/passwd &&\
    echo ava:x:106: >> /etc/group
RUN chown -R ava:ava /dist/opt/cassandra

RUN mkdir -p /dist/etc/security/
ADD limits.conf /dist/etc/security/
RUN tar cf /overlayfs.tar .
