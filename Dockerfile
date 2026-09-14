FROM ghcr.io/containerbase/base:14.15.0@sha256:558d3c79e6d804763a333454c3597eb0524fd45fe02e900c0a8d14cf726b393b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
