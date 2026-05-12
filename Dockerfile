FROM ghcr.io/containerbase/base:14.10.9@sha256:84055e6df0bddc285b73576e2f68cd7dd30f89f2a1eff6404d53ecccd476866f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.3

RUN install-builder.sh

WORKDIR /src
