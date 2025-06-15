FROM ghcr.io/containerbase/base:13.8.40@sha256:9556928ac9b00456572b549c1f870e771e1bf244649bf4d2110a16b0bbd2b7b5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
