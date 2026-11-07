FROM ghcr.io/containerbase/base:14.66.6@sha256:54ca0bd3a74ddcd92b838512401ffed05a07f34b0b95d925041a20bf9d50253f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
