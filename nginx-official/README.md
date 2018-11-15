# nginx

# 配置转发  
www.canary.com/mall/*
www.canary.com/college/*

# 配置负载均衡
www.canary.com/mall服务，后端部署8001，8002两个端口  
www.canary.com/college下服务，后端部署9001，9002两个服务  

# nginx  
http://www.canary.com/mall/api/v1/alive  

# server  
http://127.0.0.1:8001/mall/api/v1/alive  
http://127.0.0.1:8002/mall/api/v1/alive  
或
http://192.168.117.37:8001/mall/api/v1/alive  
http://192.168.117.37:8002/mall/api/v1/alive  

# server
http://127.0.0.1:9001/college/api/v1/alive  
http://127.0.0.1:9002/college/api/v1/alive  
或  
http://192.168.117.37:9001/college/api/v1/alive  
http://192.168.117.37:9002/college/api/v1/alive  