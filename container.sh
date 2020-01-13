#! /bin/bash
APP_NAME=monerod
APP_PATH=$(pwd)

docker rm -f $APP_NAME
docker run -d \
        --user root \
        --restart always \
        --network producao \
        --name $APP_NAME \
        -p 18080:18080 \
        -p 18081:18081 \
        -v $APP_PATH/config:/config \
        -v /opt/monero/data:/root/.bitmonero \
        gilmariokpslow/monerod --non-interactive