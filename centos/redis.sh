# 下载
cd /opt
wget http://download.redis.io/releases/redis-5.0.0.tar.gz

# 安装
zxvf redis-5.0.0.tar.gz
ln -s redis-5.0.0 redis
mv redis-5.0.0.tar.gz /opt/tmp
cd /opt/redis
make

# 启动


# 验证是否成功