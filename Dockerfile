FROM ghcr.io/containerbase/base:13.8.47@sha256:5830fbf173c08e78540756af7f6977c5f0ff4893fcb12b12b5034f8972acd609

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
