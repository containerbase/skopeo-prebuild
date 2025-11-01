FROM ghcr.io/containerbase/base:13.23.16@sha256:35631f6c137540c78779bf71f0d514caa5cd3699274067736956a91acdda68c6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.3

RUN install-builder.sh

WORKDIR /src
