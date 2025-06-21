# Use a Java 17 base image (or whatever version you need)
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy the jar file (update with your actual jar file name)
COPY target/chat-0.0.1-SNAPSHOT.jar app.jar

# Expose the port
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
