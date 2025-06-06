FROM ghcr.io/containerbase/base:13.8.37@sha256:63e55d7e39f3a3de00357b76f2e1a93054ce65c5b8c9bd816898e877b053706a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
