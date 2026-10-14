FROM ghcr.io/containerbase/base:14.33.0@sha256:24fd8b38eb9e12e868886937eb778434eb49e220ab5638078509a0711646f8ee

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
