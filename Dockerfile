FROM ghcr.io/containerbase/base:14.52.9@sha256:7829d02a3cd28f1662fc716cf3c1cc0c674f57e20ec4fca99b2aca62aa036973

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
