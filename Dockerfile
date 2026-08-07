FROM ghcr.io/containerbase/base:14.13.16@sha256:9543fd8aaa71df9cc386517ccd6188b65ba67b7ee249461b224142639f80145c

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.5

RUN install-builder.sh

WORKDIR /src
