FROM motebus/flowbot

EXPOSE 1880
ENV FLOW=flows.json \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules \
    TZ=utc-8 \
    DC=dc@dc3.ypcloud.com:6788 \
    MOTEBUS_GATEWAY=127.0.0.1

COPY . /data/.node-red
RUN cd /data/.node-red && \
    npm install

WORKDIR /usr/src/node-red

CMD npm start -- -u /data/.node-red 