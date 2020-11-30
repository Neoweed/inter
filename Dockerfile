FROM anapsix/alpine-java:jdk8



ENV OrgID=481e2f0e-ade1-4932-a302-80e24b352541

ENV Auth=YWtoaWwxNTk3NTMxMjNAZ21haWwuY29tOkg2NkFYUjY2Q1UwT1IzOUg=

ENV APIKey=tCwxz8bLACPq3RHL6Jh5p1Y7y13l35ZE



ENV CONTRAST__BASEURL=https://ce.contrastsecurity.com/Contrast/api/ng/$OrgID

RUN mkdir /opt/app
RUN mkdir /opt/contrast

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl
RUN apk update; apk add curl
RUN wget https://github.com/WebGoat/WebGoat/releases/download/7.1/webgoat-container-7.1-exec.jar -O /opt/app/webgoat.jar

RUN curl --max-time 20 $CONTRAST__BASEURL/agents/default/JAVA -H API-Key:$APIKey -H Authorization:$Auth -o /opt/contrast/contrast.jar

EXPOSE 8080

CMD ["java","-javaagent:/opt/contrast/contrast.jar","-Dcontrast.standalone.appname=WebGoatDocker","-Dcontrast.server=WebGoatDockerServer1","-jar","/opt/app/webgoat.jar"]