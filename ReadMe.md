<<pom.xml>>
=> 2.4.5 parent version is working fine, while getting "Caused by: java.lang.NoClassDefFoundError: Could not initialize class org.hibernate.validator.internal.engine.valueextraction.ValueExtractorManager" error in 2.0.4.RELEASE version.
=>  <?xml version="1.0" encoding="UTF-8"?>
    <project xmlns="http://maven.apache.org/POM/4.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    
        <groupId>org.example</groupId>
        <artifactId>spring-demo-k8s</artifactId>
        <version>1.0-SNAPSHOT</version>
    
        <parent>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-parent</artifactId>
            <version>2.4.5</version>
        </parent>
    
        <properties>
            <maven.compiler.source>8</maven.compiler.source>
            <maven.compiler.target>8</maven.compiler.target>
            <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        </properties>
    
        <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        </dependencies>
    
        <build>
            <plugins>
                <plugin>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-maven-plugin</artifactId>
                </plugin>
            </plugins>
        </build>
    
    </project>

<<Dokerfile>>
=> created a Dockerfile with below content
=>  FROM openjdk:8-jdk-alpine
    COPY target/spring-demo-k8s-1.0-SNAPSHOT.jar app.jar
    ENTRYPOINT ["java","-jar", "app.jar"]

<<Steps to run container>>
=> mvn clean install
=> docker build -t vijendra/spring-boot-docker-demo . 
    => docker build -> to build docker image
    => -t to specify image name vijendra/spring-boot-docker-demo
    => . is must to pick current context for build
=> docker run -d -p 8080:8080 vijendra/spring-boot-docker-demo
    => To run docker image vijendra/spring-boot-docker-demo
    => -d to run in background
    => -p for port mapping, so any request coming in machine in port 8080 will redirect to 8080 port in this container