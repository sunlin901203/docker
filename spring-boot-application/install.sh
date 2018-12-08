# 设置输入参数
application="spring-boot-sample"
version=$1
if [ -z "$version" ];then
    version="latest"
fi
maven_home="/opt/maven"

# 打印参数
echo "application image current version is ${version}"

# 打包
$maven_home/bin/mvn clean install -Dmaven.test.skip

# 构建并推送镜像
sudo docker build -t xiaozhi90/${application}:latest -f docker/Dockerfile .
sudo docker login -u xiaozhi90 -p 'xiaozhi90docker'
sudo docker tag xiaozhi90/${application}:latest xiaozhi90/${application}:${version}
sudo docker push xiaozhi90/${application}:${version}
sudo docker push xiaozhi90/${application}:latest