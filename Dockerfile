FROM ghcr.io/containerbase/base:14.10.24@sha256:fcf2e943ff1a3371e29c1e7ad3b8b982da7c65f7b7e628e4b182b58549beefbe

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
