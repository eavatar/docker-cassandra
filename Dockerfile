FROM eavatart/jre

ADD overlayfs.tar /

ADD cassandra-run.sh /etc/service/cassandra/run
#ADD cassandra.yaml /opt/cassandra/conf/

RUN chmod a+x /etc/service/cassandra/run

# Define working directory.
WORKDIR /opt/cassandra


# exposed ports
EXPOSE 7199 7000 7001 9160 9042
