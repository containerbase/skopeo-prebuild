FROM ghcr.io/containerbase/base:14.63.1@sha256:8255d9fdc1588d3dedcc8f449c8c755283116db92f948d962c83f7c71b126ccc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
