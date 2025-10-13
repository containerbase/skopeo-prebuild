FROM ghcr.io/containerbase/base:13.22.0@sha256:038763807dc75b7edad3b17a228af8a265af2bbb7b32b369d0bd37989e870551

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.2

RUN install-builder.sh

WORKDIR /src
