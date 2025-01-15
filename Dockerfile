FROM ghcr.io/containerbase/base:13.5.10@sha256:20b2d69890a08b6587373db4cc17d513322118bdf7961b96b946dfb55bdfc06f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
