#!/usr/bin/env bash

echo "begin startup"

# 设置输入参数
application="spring-boot-sample"
application_jar_name="spring-boot-sample-1.0.0-SNAPSHOT.jar"
profile="test"
port=8080
version=$1
if [ -z "$version" ];then
    version="latest"
fi

# 打印参数
echo "current version is ${version}"

# 拉取镜像
echo "sudo docker pull xiaozhi90/${application}:${version}"
sudo docker pull xiaozhi90/${application}:${version}

# 启动
sudo docker ps -a -q --filter "name=${application}-${port}" |grep -q . && docker stop ${application}-${port} && docker rm -fv ${application}-${port}
sudo docker run -itd --name ${application}-${port} -p ${port}:${port} xiaozhi90/${application}:${version} java -jar -Xmx1G -Xmx1G -Dspring.profiles.active=${profile} -Dserver.port=${port} -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=~/logs/oom -server -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:~/opt/${application}-gc.log ${application_jar_name}

echo "end startup"