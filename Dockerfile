FROM ghcr.io/containerbase/base:13.13.2@sha256:33ff6f9b3d219c85fc74b05c312fbc1b9d828840b5ea9c9202b13594d3b96ec8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
