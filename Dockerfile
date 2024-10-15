FROM ghcr.io/containerbase/base:12.0.4@sha256:b2c5f5e280d0192942691cf8e74424fbca24b28a5d82b6426725d760b512c7de

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.2

RUN install-builder.sh

WORKDIR /src
