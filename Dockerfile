FROM ghcr.io/containerbase/base:13.8.53@sha256:ca91307a174c10bb3e82f9fe269993e3c8174b0aee77077f3cd4e4c38565d009

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
