FROM ghcr.io/containerbase/base:13.14.3@sha256:bf2c595e88888228e8410acc76001184cd729db25428524c9306c120693f73c0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
