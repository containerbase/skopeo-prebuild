FROM ghcr.io/containerbase/base:13.13.1@sha256:97595d32fc856428104bb281fb68ff168a4d52018ed80fc75fb9cb498a4afa60

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
