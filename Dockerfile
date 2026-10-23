FROM ghcr.io/containerbase/base:14.52.3@sha256:0bfd1147de69e38a00afafad15f85c5c862e3d4333df1397123c2e74ae9825ec

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
