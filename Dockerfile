FROM eclipse-temurin:11-jdk

RUN addgroup -S demo-group
RUN adduser -S demo-user -G demo-group
USER demo-group:demo-user

WORKDIR /demo
COPY target/demo-jenkins-pipeline-spring-boot.jar /demo/app.jar

ENTRYPOINT ["java","-jar","/demo/app.jar"]
