# 下载安装包
mkdir /opt/tmp
cd /opt/tmp
curl -k -O "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.0.tar.gz"
tar zxvf elasticsearch-6.5.0.tar.gz
mv elasticsearch-6.5.0 /opt/
cd /opt
ln -s elasticsearch-6.5.0 elasticsearch

# 启动
chmod 755 /opt/elasticsearch/bin/elasticsearch
./elasticsearch/bin/elasticsearch -d

# 验证是否启动成功
curl --head http://localhost:9200/
curl http://localhost:9200/


# 备注
# curl -k, --insecure      Allow connections to SSL sites without certs (H)
     --interface INTERFACE  Use network INTERFACE (or address)
# curl -O,下载文件
# ./elasticsearch/bin/elasticsearch -d，-d表示后台运行