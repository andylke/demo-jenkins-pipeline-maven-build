FROM eclipse-temurin:11-jdk


ARG GROUP_NAME="demo"
ARG USER_NAME="demo"
RUN addgroup --system $GROUP_NAME && adduser $USER_NAME --ingroup $GROUP_NAME

RUN mkdir /app
RUN chown -R $USER_NAME:$GROUP_NAME /app
RUN chmod 777 /app

USER $USER_NAME


ARG ARTIFACT_ID
ARG VERSION
COPY target/$ARTIFACT_ID-$VERSION.jar /app/app.jar

ENTRYPOINT java -jar /app/app.jar
