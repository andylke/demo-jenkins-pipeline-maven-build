ADD BUILD_ARTIFACT_ID
ADD BUILD_VERSION

FROM eclipse-temurin:11-jdk

RUN addgroup -S demo-group
RUN adduser -S demo-user -G demo-group
USER demo-group:demo-user

COPY target/${BUILD_ARTIFACT_ID}-${BUILD_VERSION}.jar /demo/${BUILD_ARTIFACT_ID}.jar

ENTRYPOINT ["java","-jar","/demo/${BUILD_ARTIFACT_ID}.jar"]
