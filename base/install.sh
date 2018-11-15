# 设置输入参数
application="base"
version=$1
if [ -z "$version" ];then
    version="latest"
fi

# 打印参数
echo "application image current version is ${version}"

# 构建并推送镜像
sudo docker build -t xiaozhi90/${application}:latest -f base/Dockerfile .
sudo docker login -u xiaozhi90 -p 'xiaozhi90docker'
sudo docker tag xiaozhi90/${application}:latest xiaozhi90/${application}:${version}
sudo docker push xiaozhi90/${application}:${version}
sudo docker push xiaozhi90/${application}:latest