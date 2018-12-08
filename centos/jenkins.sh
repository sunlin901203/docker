# 下载安装包
cd /opt
curl -L -O -H "https://pkg.jenkins.io/redhat/jenkins-2.154-1.1.noarch.rpm"
tar zxvf jdk-8u191-linux-x64.tar.gz
ln -s jdk1.8.0_191 java
mv jenkins-2.154-1.1.noarch.rpm /opt/tmp

# 验证是否成功
java -version



