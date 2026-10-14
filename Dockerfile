FROM ghcr.io/containerbase/base:14.37.0@sha256:80417733a8f9a3b2ec8aa027c3b8183980175be1555b07789b143ba426a427ec

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
