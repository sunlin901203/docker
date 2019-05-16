FROM centos:centos6

MAINTAINER 2018-10-01 xiaozhi90 sunlin901203@qq.com

# common
RUN alias ll="ls -al"

# timezone
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# 添加测试用户work，密码work，并且将此用户添加到sudoers里
RUN groupadd -g 500 work && useradd -u 500 -m -g work work -s /bin/bash && \
    echo "work:work" | chpasswd && \
    echo "work ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown work:work /home/work && \
    echo "root:root" | chpasswd

# soft
RUN yum install wget -y
RUN yum install gcc -y
RUN yum install lrzsz -y
RUN yum install net-tools -y
RUN yum install xz -y

# java
WORKDIR /opt/
RUN curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
RUN tar zxvf jdk-8u191-linux-x64.tar.gz
RUN rm -f jdk-8u191-linux-x64.tar.gz
RUN ln -s jdk1.8.0_191 java
ENV JAVA_HOME=/opt/java
ENV PATH=${PATH}:/opt/java/bin

# maven
WORKDIR /opt/maven/

# git
WORKDIR /opt/git/

# arthas
WORKDIR /opt/arthas/
RUN wget https://alibaba.github.io/arthas/arthas-boot.jar

# nginx
WORKDIR /opt/nginx/

# mysql
WORKDIR /opt/mysql/

# 安装redis
WORKDIR /opt/
RUN wget http://download.redis.io/releases/redis-5.0.0.tar.gz
RUN tar zxvf redis-5.0.0.tar.gz && rm -f redis-5.0.0.tar.gz && ln -s redis-5.0.0 redis
WORKDIR redis-5.0.0
RUN make

# elasticsearch
WORKDIR /opt/elasticsearch/

# jenkins
WORKDIR /opt/
RUN wget https://pkg.jenkins.io/redhat-stable/jenkins-2.150.1-1.1.noarch.rpm
RUN rpm -ih jenkins-2.60-1.1.noarch.rpm
RUN mv jenkins-2.150.1-1.1.noarch.rpm /opt/tmp/
RUN service jenkins start
RUN curl http://localhost:8080

# zipkin
WORKDIR /opt/zipkin/
RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s
#RUN nohup java -jar zipkin.jar --zipkin.storage.type=elasticsearch --zipkin.storage.elasticsearch.hosts=127.0.0.1:9200,127.0.0.1:9201 --zipkin.storage.elasticsearch.index=zipkin --zipkin.storage.elasticsearch.username=elastic --zipkin.storage.elasticsearch.password=123456 --zipkin.ui.default-lookback=86400000 --zipkin.ui.query-limit=100 >output 2>&1 &
#RUN curl http://127.0.0.1:9411/health

# ffmpeg
# RUN curl -O https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
WORKDIR /opt/
COPY ./deploy/ffmpeg-release-amd64-static.tar.xz /opt/
RUN tar xvJf ffmpeg-release-amd64-static.tar.xz && rm -f ffmpeg-release-amd64-static.tar.xz
ENV PATH=${PATH}:/opt/ffmpeg-4.1.3-amd64-static

# application
WORKDIR /opt/workspace/

# log
WORKDIR /opt/log/

CMD ["bash"]