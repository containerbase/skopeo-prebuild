FROM ghcr.io/containerbase/base:13.4.3@sha256:7915b8f0716a06510bb7e7ea63adbb9628be9da96d63b8cff2e3ed51c615af4f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
