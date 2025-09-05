# ---------- Build Stage ----------
FROM maven:3.9.9-eclipse-temurin-21 AS build

# Set working directory inside container
WORKDIR /app

# Copy only pom.xml first (better caching of dependencies)
COPY pom.xml .

# Pre-download dependencies (avoids re-downloading unless pom.xml changes)
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application (skip tests here since you already test in CI step)
RUN mvn clean package -DskipTests

# ---------- Runtime Stage ----------
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy built JAR from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port (change if your app uses a different one)
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
