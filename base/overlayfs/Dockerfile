FROM eavatar/builder

WORKDIR /dist

RUN \
  mkdir -p opt/cassandra usr/lib/ lib

RUN  wget -O - http://www.us.apache.org/dist/cassandra/2.1.2/apache-cassandra-2.1.2-bin.tar.gz \
  | tar xzf - --strip-components=1 -C "opt/cassandra";

RUN rm -rf /dist/opt/cassandra/javadoc
RUN mkdir -p \
    /dist/opt/cassandra/logs \
    /dist/opt/cassandra/data \
    /dist/data/cassandra/commitlog  \
    /dist/data/cassandra/saved_caches \
    /dist/data/cassandra/data

RUN chown -R ava:ava /dist/opt/cassandra &&\
    chown -R ava:ava /dist/data/cassandra

RUN mkdir -p /dist/etc/security/limits.d
ADD limits.conf /dist/etc/security/

RUN \
    cp /lib/x86_64-linux-gnu/libgcc_s.so.1 lib/ && \
    cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 usr/lib/

RUN tar cf /overlayfs.tar .
