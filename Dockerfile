# stage 1 - building
FROM maven:3-eclipse-temurin-21-alpine AS build
WORKDIR /app
# dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B
# building
COPY src ./src
RUN mvn package
# stage 2 - running
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/JavaPipeline-*.jar ./app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]


# FROM eclipse-temurin:21-jre-alpine
# WORKDIR /app
# COPY ./target/JavaPipeline-0.1.0.jar /app/JavaPipeline.jar
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "/app/JavaPipeline.jar"]
