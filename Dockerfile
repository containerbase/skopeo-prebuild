FROM ghcr.io/containerbase/base:13.2.5@sha256:a260c3d038ade0072f0e7cf19f84960a49a2ac5007f2ff495dc9771db2ce6aac

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
