FROM ghcr.io/containerbase/base:13.2.1@sha256:35277aa27b7e9f4a370e066c5e97a1d4c59c2d55a610cf763045d18b3aeccb33

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
