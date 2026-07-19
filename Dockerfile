FROM ghcr.io/containerbase/base:14.13.4@sha256:01b2378b20d16e0125720e7202664f1c8f968c08050903cab1388c23b1ec7bd3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.5

RUN install-builder.sh

WORKDIR /src
