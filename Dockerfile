FROM dockerfile/java:oracle-java7

ENV SOLR_VERSION 4.10.2
ENV SOLR solr-$SOLR_VERSION

RUN \
    curl -O http://www.eu.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
    mkdir -p /opt && \
    tar xf $SOLR.tgz -C /opt/ && \
    rm $SOLR.tgz && \
    ln -s /opt/$SOLR /opt/solr

EXPOSE 8983
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]
