FROM ghcr.io/containerbase/base:11.11.28@sha256:3c833f29d6501127d3f81c6a6fc3103bb986e171168c5be476a7b4babcd54849

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.1

RUN install-builder.sh

WORKDIR /src
