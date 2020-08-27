FROM ubuntu:20.04 as download
RUN apt update && apt install -y wget

WORKDIR /opt

RUN wget https://downloads.getmonero.org/cli/linux64 && \
    tar -xvf linux64

FROM ubuntu:20.04
LABEL manteiner=gilmariosoftware@gmail.com
WORKDIR /opt
COPY config /

COPY --from=download /opt/monero-x86_64-linux-gnu-v0.16.0.3/monero-wallet-rpc /opt
EXPOSE 18082
VOLUME /opt/wallet

ENTRYPOINT ["/opt/monero-wallet-rpc" ,"--config-file", "/config"]
