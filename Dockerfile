FROM ghcr.io/containerbase/base:14.26.0@sha256:d846944451a4ea14417c5bea3a23bec634d7cb5a0161c8f4b9fe3c7c73459a01

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
