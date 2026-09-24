FROM ghcr.io/containerbase/base:14.18.1@sha256:263b8061944826b060f7112794d4a8f7457d589934714fb97da269c710212783

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
