FROM ghcr.io/containerbase/base:14.14.1@sha256:ff5cec29c82fc83836115c9aff12456ed170cccf80d0b69c7c14834a2972fca3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.0

RUN install-builder.sh

WORKDIR /src
