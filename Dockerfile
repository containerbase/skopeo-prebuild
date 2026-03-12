FROM ghcr.io/containerbase/base:14.5.4@sha256:561a75770ded8e89bd44cbf9bc07aa00c17fe020caf7ee41e24ca4f4fca98950

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.1

RUN install-builder.sh

WORKDIR /src
