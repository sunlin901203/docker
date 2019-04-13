echo "stop start."

application="spring-boot-sample"
port=8080

# 停止
sudo docker ps -a -q --filter "name=${application}-{port}" |grep -q . && docker stop ${application}-${port} && docker rm -fv ${application}-${port}

echo "stop complete."