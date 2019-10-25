FROM alpine

COPY files/ /tmp

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories &&\
    apk add --no-cache python3-dev build-base nginx curl&&\
    pip3 install -i https://pypi.douban.com/simple --no-cache-dir -r /tmp/src/requirements.txt &&\
    mv /tmp/src/app / &&\
    mkdir /run/nginx &&\
    mv /tmp/flag /var/www/localhost/htdocs/ &&\
    mv /tmp/docker-daemon / &&\
    mv /tmp/default.conf /etc/nginx/conf.d/ &&\
    mv /tmp/index.html /var/www/localhost/htdocs/ &&\
    chmod +x /docker-daemon

EXPOSE 8000

CMD ["/docker-daemon"]
