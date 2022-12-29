FROM openjdk:8-jdk-alpine
COPY target/spring-demo-k8s-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar", "app.jar"]