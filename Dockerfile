FROM ghcr.io/containerbase/base:13.4.0@sha256:632b07d4a7c0019be8bb7b7b22d551bc3d574a25054ee12ce16950652db9789a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
