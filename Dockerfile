FROM ghcr.io/containerbase/base:11.6.0@sha256:dfa1770c45ddce16f755c0cd424c6b36c8ff705c636150587d527dfea02059e3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.22.5

RUN install-builder.sh

WORKDIR /src
