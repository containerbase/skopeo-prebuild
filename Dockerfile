FROM ghcr.io/containerbase/base:13.8.50@sha256:b9da075fc6cc37bbbcf02e775806ff00c9e28773ea2c3673fd869e460871017e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
