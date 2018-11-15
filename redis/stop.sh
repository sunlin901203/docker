echo "stop start."

application = "redis"

# 停止
sudo docker ps -a -q --filter "name=${application}" |grep -q . && docker stop ${application} && docker rm -fv ${application}

echo "stop complete."