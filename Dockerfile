FROM openjdk:8

RUN curl -LO http://www-us.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz && \
    tar -xzvf apache-maven-3.5.0-bin.tar.gz && \
    rm apache-maven-3.5.0-bin.tar.gz && \
    mv apache-maven-3.5.0 /opt

ENV PATH "/opt/apache-maven-3.5.0/bin:${PATH}"

RUN useradd -m maven && \
    mkdir -p /home/maven/.m2 && \
    chown maven:maven /home/maven/.m2

VOLUME /home/maven/.m2

USER maven

ENTRYPOINT ["mvn"]
