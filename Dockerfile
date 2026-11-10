FROM ghcr.io/containerbase/base:14.66.16@sha256:e9ddc0dc55f7aceff2cff40b1f7767d20cdd4be377c1a3f4b7e0429e5b574fcd

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.4

RUN install-builder.sh

WORKDIR /src
