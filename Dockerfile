FROM ghcr.io/containerbase/base:13.5.3@sha256:715965d5ca7f6bdbe8e6797d73c376e7a8edd6db07dd7565b7055c68df2e82db

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
