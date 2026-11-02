FROM ghcr.io/containerbase/base:14.61.0@sha256:f7aab6a33cf36affdbeed71ae3c4248c48af562b2fa8c12474748899bf5cd93d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
