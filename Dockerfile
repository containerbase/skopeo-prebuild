FROM ghcr.io/containerbase/base:13.25.19@sha256:fbacc0d46a6b1bb65a8df1a21a2beda5e89dd14739ad9e5a6e0cc3def0f21b27

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.5

RUN install-builder.sh

WORKDIR /src
