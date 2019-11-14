# Build stage
FROM maven:3.3.9-jdk-8-alpine AS build-env

# Create app directory
WORKDIR /pride-api

COPY src ./
COPY pom.xml ./
RUN mvn clean package

# Package stage
FROM maven:3.3.9-jdk-8-alpine
WORKDIR /pride-api
COPY --from=build-env COPY /pride-api/target/*.jar ./
CMD [ "java", "-jar", "*.jar" ]
