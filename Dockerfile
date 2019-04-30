FROM openjdk
MAINTAINER Mathew James <matjamese@gmail.com>
ADD target/account-service.jar account-service.jar
ENTRYPOINT ["java", "-jar", "/account-service.jar"]
EXPOSE 2222