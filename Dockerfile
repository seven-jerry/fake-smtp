ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN mkdir -p /output

ADD target/fakeSMTP*.jar /fakeSMTP.jar

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/tmp", "--port", "25", "--start-server"]
