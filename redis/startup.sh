echo "begin startup"

# 设置输入参数
application="redis"
profile="test"
port=6379
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
sudo docker ps -a -q --filter "name=${application}" |grep -q . && docker stop ${application} && docker rm -fv ${application}
sudo docker run -itd --name ${application} --net=host xiaozhi90/${application}:${version} /opt/redis/src/redis-server

echo "end startup"