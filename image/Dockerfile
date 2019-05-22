FROM alpine:3.4

RUN apk add --update nginx && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/ssl
RUN mkdir /etc/ssl/localhost

COPY localhost.pem /etc/ssl/localhost/
# COPY vhost.conf /etc/nginx/conf.d/

RUN mkdir /www-data

CMD ["nginx"]
