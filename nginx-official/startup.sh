docker_name=nginx
version=stable

echo "${docker_name} begin startup"
echo "current version is ${version}"

# pull image
echo "sudo docker pull nginx:${version}"
sudo docker pull nginx:${version}

# start
sudo docker ps -a -q --filter "name=${docker_name}" |grep -q . && docker stop ${docker_name} && docker rm -fv ${docker_name}
sudo docker run --name ${docker_name} -p 80:80 -v $PWD/www:/www -v $PWD/conf/nginx.conf:/etc/nginx/nginx.conf -v $PWD/logs:/wwwlogs -d nginx

echo "${docker_name} end startup"