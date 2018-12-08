FROM centos:centos6

MAINTAINER 2018-10-01 xiaozhi90 sunlin901203@qq.com

#RUN yum install -y pcre-devel wget net-tools gcc zlib zlib-devel make openssl-devel
#RUN useradd -M -s /sbin/nologin nginx
#ADD http://nginx.org/download/nginx-1.6.2.tar.gz .
#RUN tar zxvf nginx-1.6.2.tar.gz
#RUN mkdir -p /usr/local/nginx
#RUN cd nginx-1.6.2 && ./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_stub_status_module && make && make install
#RUN ln -s /usr/local/nginx/sbin/* /usr/local/sbin/


RUN yum install -y pcre-devel wget net-tools gcc zlib zlib-devel make openssl-devel
ADD http://nginx.org/download/nginx-1.8.0.tar.gz .
RUN tar zxvf nginx-1.8.0.tar.gz .
RUN mkdir -p /usr/local/nginx
RUN cd nginx-1.8.0 && ./configure --prefix=/usr/local/nginx && make && make install
RUN rm -vf /usr/local/nginx/conf/nginx.conf
COPY .nginx_conf /usr/local/nginx/conf/nginx.conf

EXPOSE 80

ENTRYPOINT nginx -g "daemon off;"

#CMD ["nginx"]