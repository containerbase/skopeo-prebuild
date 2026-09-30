FROM ghcr.io/containerbase/base:14.21.0@sha256:7cd631b480d71a93adeb126890ef0823672b724df2662ba8e784284c548db177

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
