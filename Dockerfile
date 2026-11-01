FROM ghcr.io/containerbase/base:14.59.4@sha256:88f18523902c357e23b9ec99996214e2aec1e79b49fb2fb0681819902f6b496a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
