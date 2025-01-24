FROM ghcr.io/containerbase/base:13.7.1@sha256:30723babfc2fa1699d87f6ee26b145b8974c59aaf902f274822f8a2268756269

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.5

RUN install-builder.sh

WORKDIR /src
