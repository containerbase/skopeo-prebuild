FROM ghcr.io/containerbase/base:14.62.0@sha256:721a1ff0f43c8758a1fe49802179fb3dccf3170325300e78b5b33d51e6b1d409

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
