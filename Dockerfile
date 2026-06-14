FROM ghcr.io/containerbase/base:14.11.2@sha256:2f30a045b55d2f743d63bb916c6ce48d905e69a34619926740cd5261fbdaeadf

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
