FROM ghcr.io/containerbase/base:14.66.8@sha256:5cc4b75796c4bee3c62f07912734f74bd48d9fe940898e3bb39da8578f9dbc8a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
