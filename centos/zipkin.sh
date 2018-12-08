# 下载
mkdir /opt/zipkin
cd /opt/zipkin
curl -sSL https://zipkin.io/quickstart.sh | bash -s

# 安装

# 启动
nohup java -jar zipkin.jar --zipkin.storage.type=elasticsearch --zipkin.storage.elasticsearch.hosts=127.0.0.1:9200,127.0.0.1:9201 --zipkin.storage.elasticsearch.index=zipkin --zipkin.storage.elasticsearch.username=elastic --zipkin.storage.elasticsearch.password=123456 --zipkin.ui.default-lookback=86400000 --zipkin.ui.query-limit=100 >output 2>&1 &

# 验证
curl http://127.0.0.1:9411/health

# 备注
# nohup后台启动
