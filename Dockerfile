# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk-alpine

# Set the working directory within the container
WORKDIR /app

# Copy the JAR file from your local machine to the container
COPY target/kaddem-SNAPSHOT-0.1.jar /app/kaddem-SNAPSHOT-0.1.jar

# Expose the port your Java application will run on
EXPOSE 8082

# Define the command to run your application
CMD ["java", "-jar", "kaddem-SNAPSHOT-0.1.jar"]

