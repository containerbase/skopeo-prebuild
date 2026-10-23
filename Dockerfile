FROM ghcr.io/containerbase/base:14.52.1@sha256:099e3a3733ff5abdda9c98ed31164356e605bd4b8c724b6a5668598073c0173d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
