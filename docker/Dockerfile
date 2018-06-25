FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install libssl1.0.0 libfindbin-libs-perl -y
RUN mkdir -p /demo/logs
RUN mkdir -p /demo/conf
WORKDIR /demo
COPY *.deb /tmp
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
RUN dpkg -i /tmp/*.deb
ENV PATH=$PATH:/usr/local/openresty/luajit/bin/:/usr/local/openresty/nginx/sbin/:/usr/local/openresty/bin/
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
