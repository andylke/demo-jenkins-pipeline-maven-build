FROM eclipse-temurin:11-jdk


ARG GROUP_NAME="demo"
ARG USER_NAME="demo"
RUN addgroup --system $GROUP_NAME && adduser $USER_NAME --ingroup $GROUP_NAME

RUN mkdir /app
RUN chown -R $USER_NAME:$GROUP_NAME /app
RUN chmod 777 /app

USER $USER_NAME


ARG BUILD_ARTIFACT_ID
ARG BUILD_VERSION
COPY target/$BUILD_ARTIFACT_ID-$BUILD_VERSION.jar /app/$BUILD_ARTIFACT_ID.jar

ENTRYPOINT java -jar /app/$BUILD_ARTIFACT_ID.jar
