FROM ghcr.io/containerbase/base:13.14.9@sha256:9b745e6d5ef249d3b42b0dd61993254599a395b2e3deab397708eccc86ae4e4b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
