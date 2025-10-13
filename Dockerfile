FROM ghcr.io/containerbase/base:13.23.0@sha256:cb4ed10e6f554ea0d83a0cd5b7b933e1dd012ba8ee744263e8191e44de71974f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.3

RUN install-builder.sh

WORKDIR /src
