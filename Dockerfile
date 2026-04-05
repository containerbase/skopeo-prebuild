FROM ghcr.io/containerbase/base:14.6.13@sha256:a73dd9860a4a872d9487936af5ef14ccefce28793d10cb21a868106ead6cd06a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.1

RUN install-builder.sh

WORKDIR /src
