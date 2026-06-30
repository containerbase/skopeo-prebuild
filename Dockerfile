FROM ghcr.io/containerbase/base:14.12.4@sha256:119546549220b98ff653b8c822cc5c1f323151c86ef8dacf273bb53e128192b7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
