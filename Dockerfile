FROM ghcr.io/containerbase/base:14.5.3@sha256:2baa775c64f5b350c0f11b01c15a0f6f385f1daa60f8c42409431933fcd1f2c8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.1

RUN install-builder.sh

WORKDIR /src
