FROM ghcr.io/containerbase/base:13.7.11@sha256:692f1f18416793676b12e3836ade0a6dd4613fe8dd2e03c4e0fb760f304d055a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.6

RUN install-builder.sh

WORKDIR /src
