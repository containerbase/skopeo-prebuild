FROM ghcr.io/containerbase/base:14.59.0@sha256:88013d3d2c88ecfe9e44eaaa22ee771cefb3a51117002cbc073b9a95a8f969da

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
