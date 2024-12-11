FROM ghcr.io/containerbase/base:13.2.3@sha256:3fdf6d6ab9b14779164b30b7291ee65d846cf7e8635ca28b229ba927e965402b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
