FROM ghcr.io/containerbase/base:13.7.0@sha256:d07beeac908f2dc61274b1f563daaec1896753a18886361cc2beafd51857c919

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.5

RUN install-builder.sh

WORKDIR /src
