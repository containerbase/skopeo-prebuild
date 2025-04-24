FROM ghcr.io/containerbase/base:13.8.16@sha256:c44873e0a805336cc0c4f6cc475a0576584de79715d5ee14b39e2ff2548bef45

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.2

RUN install-builder.sh

WORKDIR /src
