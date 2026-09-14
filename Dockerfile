FROM ghcr.io/containerbase/base:14.15.1@sha256:b92cf6dc5dc0f57d812597ef0610803e45f00dd7993e31f95f7fdfd3da715145

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
