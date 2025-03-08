FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY ./target/JavaPipeline-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/JavaPipeline.jar"]
