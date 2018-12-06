# 下载安装包
mkdir /opt/zipkin
cd /opt/zipkin
curl -sSL https://zipkin.io/quickstart.sh | bash -s

# 后台启动
nohup java -jar zipkin.jar --zipkin.storage.type=elasticsearch --zipkin.storage.elasticsearch.hosts=127.0.0.1:9200,127.0.0.1:9201 --zipkin.storage.elasticsearch.index=zipkin --zipkin.storage.elasticsearch.username=elastic --zipkin.storage.elasticsearch.password=123456 >output 2>&1 &
