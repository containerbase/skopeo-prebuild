FROM ghcr.io/containerbase/base:14.10.2@sha256:82a777b94182764a683f94a383fcdb442ebbbc3bb3f5950c90da56e20095845d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.2

RUN install-builder.sh

WORKDIR /src
