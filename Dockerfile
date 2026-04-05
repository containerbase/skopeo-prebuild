FROM ghcr.io/containerbase/base:14.6.12@sha256:8616c735746c3551986eb7282fba91038a3846392e4e4c08e983496eedc4ae50

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.1

RUN install-builder.sh

WORKDIR /src
