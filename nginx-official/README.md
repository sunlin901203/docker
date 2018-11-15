# nginx

# 配置转发  
www.canary.com/a/*转发到a.canary.com  
www.canary.com/b/*转发到b.canary.com

# 配置负载均衡
a.canary.com下服务，后端部署8001，8002两个端口
b.canary.com下服务，后端部署9001，9002两个服务