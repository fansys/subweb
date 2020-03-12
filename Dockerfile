FROM alpine:latest
COPY . /subweb
WORKDIR /subweb

ENV WEB_HOST=http://127.0.0.1:10086 \
    CORE_HOST=http://127.0.0.1:10010 \
    AFF='不限制机场，规则生成失败，请检测调用格式。'

RUN apk add --no-cache python3-dev  \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt\
    && chmod 777 /subweb/config/subconverter \
    && chmod 777 /subweb/docker.sh
EXPOSE 10086 10010
CMD [ "/subweb/docker.sh"]