FROM ghcr.io/containerbase/base:13.13.11@sha256:0bd5fe85788427dc76269c64da0b28eac69c8c9ff742ae1afbf0caadc8e5680e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
