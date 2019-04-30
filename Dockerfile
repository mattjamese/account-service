FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} account-service.jar
ENTRYPOINT ["java","-jar","/account-service.jar"]
EXPOSE 2222