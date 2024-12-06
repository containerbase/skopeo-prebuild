FROM ghcr.io/containerbase/base:13.2.0@sha256:d1cdd6fd12da540119884af0c2e52447e046aad06f1f552439c297f1cd9b0a1e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
