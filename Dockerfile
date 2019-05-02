FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/account-service-0.1.jar account-service.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/account-service.jar"]
EXPOSE 2222