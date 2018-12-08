# 下载
cd /opt
wget https://pkg.jenkins.io/redhat-stable/jenkins-2.150.1-1.1.noarch.rpm

# 安装
rpm -ih jenkins-2.60-1.1.noarch.rpm
mv jenkins-2.150.1-1.1.noarch.rpm /opt/tmp

# 启动
service jenkins start

# 验证
curl --head http://localhost:8080
curl http://localhost:8080

# 备注
# 安装完后会出现以下四种目录
# war包：/usr/lib/jenkins/jenkins.war
# 配置文件：/etc/sysconfig/jenkins
# JENKINS_HOME目录：/var/lib/jenkins
# jenkins日志文件：/var/log/jenkins/jenkins.log
# 参考：https://blog.csdn.net/qq_28666081/article/details/82288332





