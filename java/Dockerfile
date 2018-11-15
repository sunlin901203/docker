FROM xiaozhi90/base:latest

# 安装项目
ADD target/spring-boot-sample-1.0.0-SNAPSHOT.jar .

RUN echo "JAVA_HOME=$JAVA_HOME" && \
    echo "PATH=$PATH" && \
    java -version && \
    ls -l /opt

expose 8080

CMD ["bash"]