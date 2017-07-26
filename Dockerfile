FROM frolvlad/alpine-oraclejdk8:slim
RUN apk update \
    && apk upgrade \
    && apk add --no-cache --update curl ca-certificates openssl git tar bash \
    && adduser -D -h /home/javauser javauser

USER javauser

VOLUME /tmp
WORKDIR /home/javauser
ADD build/libs/javatest-1.0-SNAPSHOT.jar app.jar

ENV JAVA_OPTS=""
EXPOSE 8080
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /home/javauser/app.jar" ]


