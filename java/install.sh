# 设置输入参数
version=$1
if [ -z "$version" ];then
    version="latest"
fi

# 打印参数
echo "application image current version is ${version}"

# 构建并推送镜像
sudo docker build -t xiaozhi90/nginx:${version} -f Dockerfile .
sudo docker login -u xiaozhi90 -p 'xiaozhi90docker'
sudo docker tag xiaozhi90/nginx:latest xiaozhi90/nginx:${version}
sudo docker push xiaozhi90/nginx:${version}
sudo docker push xiaozhi90/nginx:latest