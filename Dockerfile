FROM ghcr.io/containerbase/base:13.7.17@sha256:2b33d4d0e8ce781f0cc58772dcb2423d3a250e6268c0394e72bbd161d3b5326e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.0

RUN install-builder.sh

WORKDIR /src
