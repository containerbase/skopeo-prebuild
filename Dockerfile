FROM ghcr.io/containerbase/base:14.64.0@sha256:3c15a62b58c102aef3960a6f65bc97b269fa0f6981bbb119d4d1836cdfc3facc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
