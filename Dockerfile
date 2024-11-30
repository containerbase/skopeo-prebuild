FROM ghcr.io/containerbase/base:13.0.23@sha256:b75d017d10b8ea1e1dde42124e63dede8eab51eaeca9f7ed8cd32a08b6e8f6e4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.3

RUN install-builder.sh

WORKDIR /src
