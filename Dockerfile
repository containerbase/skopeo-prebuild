FROM ghcr.io/containerbase/base:13.0.13@sha256:16dca9e1eddeb9a2d3b44608f309663eac089cc895bb036c1d71be9d8d0869d7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.3

RUN install-builder.sh

WORKDIR /src
