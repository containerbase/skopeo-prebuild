FROM ghcr.io/containerbase/base:14.20.1@sha256:e17cf060f30485b8580831e2bcd117a3c818effd7e48ce98c4225a05b45623f0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
