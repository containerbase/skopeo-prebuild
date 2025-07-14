FROM ghcr.io/containerbase/base:13.8.58@sha256:d43040df2900da38d2b925a0f398248add0a33b973169459cedea80505fd0bbb

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.5

RUN install-builder.sh

WORKDIR /src
