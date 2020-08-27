#!/bin/bash
APP_PATH="/opt/docker-app/wallet-rpc"
docker rm -f wallet-rpc
docker run -d \
        --name wallet-rpc \
        --network producao \
        --restart always \
        --name wallet-rpc \
        -v $APP_PATH/wallet:/opt/wallet \
        -v $APP_PATH/monero-wallet-rpc:/opt/monero-wallet-rpc \
        -v $(pwd)/config:/opt/config \
        ubuntu:20.04 /opt/monero-wallet-rpc --config-file /opt/config
