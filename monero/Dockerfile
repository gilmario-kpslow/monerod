FROM ubuntu:18.04 as download
RUN apt update && apt install -y wget

WORKDIR /opt

RUN wget https://downloads.getmonero.org/cli/linux64 && \
    tar -xvf linux64

FROM ubuntu:18.04
LABEL manteiner=gilmariosoftware@gmail.com

WORKDIR /opt

COPY config /
COPY --from=download /opt/monero-x86_64-linux-gnu-v0.15.0.1/monerod /opt
EXPOSE 18080
EXPOSE 18081
VOLUME /root/.bitmonero

ENTRYPOINT ["/opt/monerod", "--config-file", "/config", "--non-interactive"]