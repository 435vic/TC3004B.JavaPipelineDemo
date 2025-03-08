FROM eclipse-temurin
COPY target/JavaPipeline-0.0.1-SNAPSHOT.jar JavaPipeline.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/JavaPipeline.jar"]
