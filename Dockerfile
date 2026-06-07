FROM ghcr.io/containerbase/base:14.10.23@sha256:49d4865e1c8cbae4121f9d4a090518a2c0338d0b27f44ca49afa889f59143c56

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
