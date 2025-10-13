FROM ghcr.io/containerbase/base:13.20.6@sha256:24c64e916085b6670848013059abe8290cce6c99f26aa2eca036492a6a2abe02

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.2

RUN install-builder.sh

WORKDIR /src
