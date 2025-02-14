FROM ghcr.io/containerbase/base:13.7.14@sha256:cb641361951a5b74ad4ae653d389f6a37cc04010f44886fee4e527779ec7f892

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.0

RUN install-builder.sh

WORKDIR /src
