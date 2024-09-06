FROM ghcr.io/containerbase/base:11.11.11@sha256:35a28285bdf54adb610c63ea9e0fbce391b21c8ae7a8aaa3d00629e421a2cc87

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.1

RUN install-builder.sh

WORKDIR /src
