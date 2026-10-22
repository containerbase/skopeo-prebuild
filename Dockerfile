FROM ghcr.io/containerbase/base:14.50.0@sha256:c8289c680c23b4fa45998a53e601f0f2e7ef7693fd0a93c6b24acfb58d972dfd

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
