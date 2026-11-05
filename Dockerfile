FROM ghcr.io/containerbase/base:14.66.2@sha256:5dcdb0aa9e9a0fc33b4ca0f013720b3031ccac36f35f9476f5818f44dd49367c

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
