FROM ghcr.io/containerbase/base:13.8.8@sha256:34251c4bc8b6bbaeb8853a63823e67093b6e4071bb533154b7e1d00f7d483d85

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.1

RUN install-builder.sh

WORKDIR /src
