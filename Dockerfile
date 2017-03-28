FROM debian:jessie
LABEL maintainer "plashchynski@gmail.com"

RUN set -x \
        && apt-get update && apt-get install -y --no-install-recommends bind9 \
        && rm -rf /var/lib/apt/lists/*

EXPOSE 53/udp 53/tcp

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["named"]
