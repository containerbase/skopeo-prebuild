FROM ghcr.io/containerbase/base:13.14.0@sha256:58400bb44d0b3c543a391832418369df26d12a9f624359faf095a77b351a71c9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
