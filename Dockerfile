FROM openjdk:8
ADD target/kaddem-SNAPSHOT-0.1.jar kaddem.jar
EXPOSE 8089
ENTRYPOINT ["java", "-jar", "kaddem.jar"]



