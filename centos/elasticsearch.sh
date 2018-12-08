# 下载安装包
mkdir /opt/tmp
cd /opt/tmp
curl -L -k -C - -O "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.0.tar.gz"
tar zxvf elasticsearch-6.5.0.tar.gz
mv elasticsearch-6.5.0 /opt/
cd /opt
ln -s elasticsearch-6.5.0 elasticsearch

# 启动
chmod 755 /opt/elasticsearch/bin/elasticsearch
./elasticsearch/bin/elasticsearch -d

# 验证是否成功
curl --head http://localhost:9200/?pretty
curl http://localhost:9200/?pretty


# 备注
# curl -k, --insecure      Allow connections to SSL sites without certs (H)
# curl -O,下载文件
# curl -L,通过-L选项进行重定向,默认情况下CURL不会发送HTTP Location headers(重定向).当一个被请求页面移动到另一个站点时，会发送一个HTTP Location
#         例如：访问google.com时，会自动将地址重定向到google.com.hk上。使用-L选项进行强制重定向,让curl使用地址重定向，此时会查询google.com.hk站点
# curl -C，通过使用-C选项可对大文件使用断点续传功能
# ./elasticsearch/bin/elasticsearch -d，-d表示后台运行