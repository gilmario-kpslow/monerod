FROM ubuntu:18.04 as download
RUN apt update && apt install -y wget

WORKDIR /opt

RUN wget https://downloads.getmonero.org/cli/linux64 && \
    tar -xvf linux64

FROM ubuntu:18.04

WORKDIR /opt

COPY --from=download /opt /opt
COPY config /

EXPOSE 18080
EXPOSE 18081
VOLUME /root/.bitmonero
VOLUME /config

ENTRYPOINT ["/opt/monerod", "--config-file", "/config", "--non-interactive"]