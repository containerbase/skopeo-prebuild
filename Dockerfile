FROM ghcr.io/containerbase/base:14.12.1@sha256:ab0a2742e98da3ea80a8f65a34a1de4dca774d74496f2276c5ec3775189ac320

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
