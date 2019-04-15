#!/usr/bin/env bash

# common
alias ll="ls -al"

# java
cd /opt/
curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
tar zxvf jdk-8u191-linux-x64.tar.gz
ln -s jdk1.8.0_191 java
mkdir /opt/tmp
mv jdk-8u191-linux-x64.tar.gz /opt/tmp
cat >> /etc/profile << EOF
export JAVA_HOME=/opt/java
export PATH=$PATH:${JAVA_HOME}/bin
EOF
source /etc/profile
java -version

# git
yum install git
git --version

# maven TODO
cd /opt/
curl -L -k -C - -O "http://mirrors.hust.edu.cn/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz"
tar zxvf apache-maven-3.6.0-bin.tar.gz
ln -s apache-maven-3.6.0 maven
mv apache-maven-3.6.0-bin.tar.gz /tmp
cat >> /etc/profile << EOF
export MAVEN_HOME=/opt/maven
export PATH=$PATH:${MAVEN_HOME}/bin
EOF
source /etc/profile
mvn -v

# arthas
mkdir /opt/arthas/
cd /opt/arthas/
wget https://alibaba.github.io/arthas/arthas-boot.jar
# java -jar arthas-boot.jar

# mysql

# redis
cd /opt/
wget http://download.redis.io/releases/redis-5.0.0.tar.gz
tar zxvf redis-5.0.0.tar.gz
ln -s redis-5.0.0 redis
mv redis-5.0.0.tar.gz /tmp
cd /opt/redis/
make

# nginx

# jenkins
# 安装完后会出现以下四种目录
# war包：/usr/lib/jenkins/jenkins.war
# 配置文件：/etc/sysconfig/jenkins
# JENKINS_HOME目录：/var/lib/jenkins
# jenkins日志文件：/var/log/jenkins/jenkins.log
# 参考：https://blog.csdn.net/qq_28666081/article/details/82288332
cd /opt/
wget https://pkg.jenkins.io/redhat-stable/jenkins-2.150.1-1.1.noarch.rpm
rpm -ih jenkins-2.60-1.1.noarch.rpm
mv jenkins-2.150.1-1.1.noarch.rpm /opt/tmp
service jenkins start
curl --head http://localhost:8080
curl http://localhost:8080

# elasticsearch
cd /opt/
curl -L -k -C - -O "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.0.tar.gz"
tar zxvf elasticsearch-6.5.0.tar.gz
ln -s elasticsearch-6.5.0 elasticsearch
mv elasticsearch-6.5.0.tar.gz /opt/tmp
chmod 755 /opt/elasticsearch/bin/elasticsearch
./elasticsearch/bin/elasticsearch -d
curl --head http://localhost:9200/?pretty
curl http://localhost:9200/?pretty

# zipkin
mkdir /opt/zipkin/
cd /opt/zipkin/
curl -sSL https://zipkin.io/quickstart.sh | bash -s
nohup java -jar zipkin.jar --zipkin.storage.type=elasticsearch --zipkin.storage.elasticsearch.hosts=127.0.0.1:9200,127.0.0.1:9201 --zipkin.storage.elasticsearch.index=zipkin --zipkin.storage.elasticsearch.username=elastic --zipkin.storage.elasticsearch.password=123456 --zipkin.ui.default-lookback=86400000 --zipkin.ui.query-limit=100 >output 2>&1 &
curl http://127.0.0.1:9411/health

# lrzsz
yum install wget -y
yum install gcc -y
yum install lrzsz -y
yum install net-tools -y
