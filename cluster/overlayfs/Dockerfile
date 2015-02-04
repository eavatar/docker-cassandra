FROM eavatar/builder

WORKDIR /dist

RUN \
  mkdir -p opt/cassandra; \
  wget -O - http://www.us.apache.org/dist/cassandra/2.1.2/apache-cassandra-2.1.2-bin.tar.gz \
  | tar xzf - --strip-components=1 -C "opt/cassandra";

RUN rm -rf /dist/opt/cassandra/javadoc
RUN mkdir -p /dist/opt/cassandra/logs /dist/opt/cassandra/data /dist/data/cassandra
RUN chown -R ava:ava /dist/opt/cassandra &&\
    chown -R ava:ava /dist/data/cassandra

RUN mkdir -p /dist/etc/security/limits.d
ADD limits.conf /dist/etc/security/
RUN tar cf /overlayfs.tar .
