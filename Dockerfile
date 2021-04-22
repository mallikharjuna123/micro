FROM openjdk:8-jdk-alpine
RUN apk --no-cache add curl
COPY target/micronaut-java-service*.jar micronaut-java-service.jar
#COPY build/libs/*-all.jar micronaut-java-service.jar
EXPOSE 8080
CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
    -Dcom.sun.management.jmxremote -noverify ${JAVA_OPTS} -jar micronaut-java-service.jar
