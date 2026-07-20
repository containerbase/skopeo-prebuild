FROM ghcr.io/containerbase/base:14.13.9@sha256:0cc5d32866fb7a64a014fc79ae907ae252444a08e87c28122a6d11296ac14128

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.5

RUN install-builder.sh

WORKDIR /src
