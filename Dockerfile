FROM ghcr.io/containerbase/base:13.0.9@sha256:7dea2662f0dc38887d055c9c588a84355d8db74f11a2d651e3cc32aee33f87f7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.3

RUN install-builder.sh

WORKDIR /src
