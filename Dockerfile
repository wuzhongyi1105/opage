FROM node:9.6.0-alpine

RUN apk upgrade --update \
 && apk add -t build-dependencies \
    build-base \
 && apk add \
    openssl \
    ca-certificates \
    git \
 && git clone https://github.com/wuzhongyi1105/opage.git /opt/opage \
 && apk del build-dependencies \
 && rm -rf /tmp/* /var/cache/apk/*

WORKDIR /opt/opage

RUN npm install

VOLUME /opt/opage/src

EXPOSE 8080 80 443

CMD npm run build
