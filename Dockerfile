FROM ghcr.io/containerbase/base:14.10.26@sha256:1c28ea278dd160efbef98ba54f1c58c69aac2a37d21f5efa72bec40eb1a16eea

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
