FROM ghcr.io/containerbase/base:13.25.21@sha256:4696970ce0d247f2e65428e58bc616a77e6b97380013ce984b3494c559155ba8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.5

RUN install-builder.sh

WORKDIR /src
