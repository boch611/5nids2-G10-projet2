FROM openjdk:8-jdk-alpine
EXPOSE 8082
ADD target/projet2-1.0.jar projet2-1.0.jar
ENTRYPOINT ["java","-jar","/projet2-1.0.jar"]
