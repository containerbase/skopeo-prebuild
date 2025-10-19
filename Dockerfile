FROM ghcr.io/containerbase/base:13.23.4@sha256:11198c502f9720ffbc0a15b55df6684d13973a8dff6089d2887194943340611e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.3

RUN install-builder.sh

WORKDIR /src
