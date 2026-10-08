FROM ghcr.io/containerbase/base:14.30.0@sha256:13811710f863010d58c4d13670826afea080f2d94fe60a71d3dd47aef15526ed

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
