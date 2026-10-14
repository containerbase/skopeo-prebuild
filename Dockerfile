FROM ghcr.io/containerbase/base:14.40.0@sha256:4db7a533e4f362803ab6f3b16beb52f4559bc74416a4120fbbfa60ac8480b979

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
