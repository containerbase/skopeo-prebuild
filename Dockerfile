FROM ghcr.io/containerbase/base:14.7.0@sha256:72494230cc680301536d1eb01160a16e0adc5fb637c4743865a4511fc04915cc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.2

RUN install-builder.sh

WORKDIR /src
