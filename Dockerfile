FROM ghcr.io/containerbase/base:14.6.4@sha256:3f29ae0ba7eee08ee4ed5e21f8445c3e48193fc1e55714cadbea0ca3d03f9131

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.1

RUN install-builder.sh

WORKDIR /src
