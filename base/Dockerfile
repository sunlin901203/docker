FROM centos:centos6

MAINTAINER 2018-10-01 xiaozhi90 sunlin901203@qq.com

# 设置时区
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

# 安装软件
RUN yum install wget -y

# 安装Java
RUN cd /opt
# RUN wget http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
RUN curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
RUN tar zxvf jdk-8u191-linux-x64.tar.gz && \
    rm -f jdk-8u191-linux-x64.tar.gz && \
    ln -s /opt/jdk1.8.0_191 /opt/java

ENV JAVA_HOME=/opt/java
ENV PATH=${PATH}:/opt/java/bin

RUN echo $JAVA_HOME && \
    echo $PATH

# 安装项目
ADD target/spring-boot-sample-1.0.0-SNAPSHOT.jar .

expose 8080

CMD ["bash"]