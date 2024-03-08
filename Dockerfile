FROM maven:3.9.6-amazoncorretto-17 AS builder
COPY src src
COPY pom.xml pom.xml
RUN mvn clean install -DskipTests

FROM amazoncorretto:17-alpine3.16 AS runtime
EXPOSE 8080
COPY --from=builder target/user-service-0.0.1-SNAPSHOT.jar user-service-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "user-service-0.0.1-SNAPSHOT.jar"]