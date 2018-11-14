FROM centos:centos6

MAINTAINER 2018-10-01 xiaozhi90 sunlin901203@qq.com

# 设置时区
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

# 安装软件
RUN wget http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz

#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN java -version
RUN echo $PATH
RUN echo $JAVA_HOME

# 安装项目
#ADD target/sentinel-0.0.1-SNAPSHOT.jar .

expose 8080

CMD ["bash"]