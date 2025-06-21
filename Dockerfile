# ---------- STAGE 1: Build the application ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Copy everything and build the jar
COPY . .
RUN mvn clean package -DskipTests

# ---------- STAGE 2: Run the application ----------
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

# Copy the JAR from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
