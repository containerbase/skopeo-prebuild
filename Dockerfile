FROM ghcr.io/containerbase/base:14.60.0@sha256:270afb8aec22e3aa2837debb235a2d1b4d4adae63b8bd8a755e24bdc09b190c6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
