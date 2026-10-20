FROM ghcr.io/containerbase/base:14.44.3@sha256:7d287f1b251352728bed1df465cdcf4b89f629acb76fcff03739bd968788ac6d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
