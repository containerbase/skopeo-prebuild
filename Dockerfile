FROM ghcr.io/containerbase/base:13.12.0@sha256:32b21d8fd7e3b984e57bbb42c50bb9dcb025a6a045e8a661e9717d69a8be0ffd

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
