FROM ghcr.io/containerbase/base:14.6.18@sha256:fef9f980e4e7eb2900e42d2e8f21f38762cf4ab0ab6a3691e2d230e98a340bb6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.2

RUN install-builder.sh

WORKDIR /src
