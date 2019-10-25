FROM node:alpine

RUN apk upgrade --update \
 && apk add \
    openssl \
    ca-certificates \
    git \
 && git clone https://github.com/wuzhongyi1105/opage.git /opt/opage \
 && apk del build-dependencies \
 && rm -rf /tmp/* /var/cache/apk/*

WORKDIR /opt/opage

VOLUME /opt/opage/src

EXPOSE 8080

CMD npm run dev
