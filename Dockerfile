# Example Dockerfile for a Java app
FROM openjdk:11-slim

# Copy the built .jar file into the image
COPY target/sonar-scanner-maven-basic-1.0.jar /app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "/app.jar"]