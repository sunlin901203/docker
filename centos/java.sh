# 下载安装包
cd /opt
curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz"
tar zxvf jdk-8u191-linux-x64.tar.gz
ln -s jdk1.8.0_191 java
mv jdk-8u191-linux-x64.tar.gz /opt/tmp

# 设置环境变量
cat >> /etc/profile << EOF
export JAVA_HOME=/opt/java
export PATH=$PATH:${JAVA_HOME}/bin
EOF
source /etc/profile

# 验证是否成功
java -version