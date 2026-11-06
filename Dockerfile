FROM ghcr.io/containerbase/base:14.66.5@sha256:0c244e2d9bee5d3b475a85ae1eccada91b47ca2c632a96aa54501ecf86ddffcc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
