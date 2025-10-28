FROM ghcr.io/containerbase/base:13.23.12@sha256:68be1b25099d8b7f44ef8663f9ec1b4112d2b71fb4a4731384f89ad9e710ab51

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.3

RUN install-builder.sh

WORKDIR /src
