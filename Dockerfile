FROM ghcr.io/containerbase/base:14.8.3@sha256:63456deaba741616f2ef3ddd6f3e7c0dfe88c48402dc68f43562608fe9a85022

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.2

RUN install-builder.sh

WORKDIR /src
