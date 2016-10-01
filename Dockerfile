FROM alpine:3.2
RUN apk --update add openjdk7-jre
RUN wget http://apache.mirrors.hoobly.com/drill/drill-1.8.0/apache-drill-1.8.0.tar.gz && tar -xzvf apache-drill-1.8.0.tar.gz && rm -rf apache-drill-1.8.0.tar.gz

# Set environment
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin

COPY rundrill.sh .

ENTRYPOINT ["./rundrill.sh"]
