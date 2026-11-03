FROM ghcr.io/containerbase/base:14.63.0@sha256:1a43239ade55c61da53bedadcafdc1642470fb34d17620f48fe0920ddad38807

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
