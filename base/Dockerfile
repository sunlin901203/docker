FROM centos:centos6

MAINTAINER 2018-10-01 xiaozhi90 sunlin901203@qq.com

# 重命名ls -l
RUN alias ll="ls -l"

# 设置时区
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

# 添加测试用户work，密码work，并且将此用户添加到sudoers里
RUN groupadd -g 500 work && useradd -u 500 -m -g work work -s /bin/bash && \
    echo "work:work" | chpasswd && \
    echo "work ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown work:work /home/work && \
    echo "root:root" | chpasswd

# 安装软件
RUN yum install wget -y && \
    yum  install  gcc -y

# 创建目录
WORKDIR /opt
RUN mkdir /opt/nginx && \
    mkdir /opt/mysql && \
    mkdir /opt/elasticsearch && \
    mkdir /opt/git && \
    mkdir /opt/maven && \
    mkdir /opt/deploy && \
    mkdir /opt/logs

# 安装nginx

# 安装redis
WORKDIR /opt
RUN wget http://download.redis.io/releases/redis-5.0.0.tar.gz
RUN tar zxvf redis-5.0.0.tar.gz && \
    rm -f redis-5.0.0.tar.gz && \
    ln -s redis-5.0.0 redis
WORKDIR redis-5.0.0
RUN make

# 安装elasticsearch

# 安装Java
WORKDIR /opt
# RUN wget http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
RUN curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
RUN tar zxvf jdk-8u191-linux-x64.tar.gz && \
    rm -f jdk-8u191-linux-x64.tar.gz && \
    ln -s jdk1.8.0_191 java

ENV JAVA_HOME=/opt/java
ENV PATH=${PATH}:/opt/java/bin

RUN echo "JAVA_HOME=$JAVA_HOME" && \
    echo "PATH=$PATH" && \
    ls -l /opt

CMD ["bash"]