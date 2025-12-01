FROM ghcr.io/containerbase/base:13.25.5@sha256:bb5278925c9693ef3048dc04eb126b5c59a45fcf30da0e53b63cafb77f46f49e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.4

RUN install-builder.sh

WORKDIR /src
