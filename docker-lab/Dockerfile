FROM openjdk:8-jdk-alpine
RUN addgroup -S notes && adduser -S notes -G notes
USER notes:notes
ARG JAR_FILE=target/*.jar
