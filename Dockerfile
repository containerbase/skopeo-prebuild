FROM ghcr.io/containerbase/base:13.8.48@sha256:5a9fc85a657efb45bf77656a2ab641fa3b507dda62d2e648e5ade2d555ba4d23

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
