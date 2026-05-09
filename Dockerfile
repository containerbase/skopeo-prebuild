FROM ghcr.io/containerbase/base:14.10.5@sha256:a44ba04e30d3e74c0d9dd75b9a28f55045012324f6b30933d8c5fedab7680285

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.3

RUN install-builder.sh

WORKDIR /src
