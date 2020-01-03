ARG BUILD_FROM
FROM $BUILD_FROM
#FROM alpine:latest

ENV LANG C.UTF-8


ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN apk update && apk add --no-cache openjdk8

ADD target/fakeSMTP*.jar /fakeSMTP.jar

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/tmp", "--port", "25", "--start-server"]
