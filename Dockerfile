FROM ghcr.io/containerbase/base:13.13.6@sha256:5ea3695fe9eeef0666ff84cd239e8b2e7f8171ed3c84921bb327d03c9d33c79f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
