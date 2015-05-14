FROM java:7

ENV SOLR_VERSION 4.10.2
ENV SOLR solr-$SOLR_VERSION

RUN \
    curl -O http://www.eu.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
    mkdir -p /opt && \
    tar xf $SOLR.tgz -C /opt/ && \
    rm $SOLR.tgz && \
    ln -s /opt/$SOLR /opt/solr

RUN \
    mv /opt/solr/example /opt/solr/cores && \
    mkdir -p /opt/solr/cores/core0/conf && \
    mkdir -p /opt/solr/cores/core1/conf

COPY solr.xml /opt/solr/cores/
COPY conf /opt/solr/cores/core0/conf
COPY conf /opt/solr/cores/core1/conf

EXPOSE 8983

WORKDIR /opt/solr

CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -s /opt/solr/cores -d cores -f"]
