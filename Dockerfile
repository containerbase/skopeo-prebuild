FROM ghcr.io/containerbase/base:14.66.21@sha256:c325d9c52815dce8b631ff0f0c66e558bbbf7c94aa9c3a606a2464de02075f92

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.4

RUN install-builder.sh

WORKDIR /src
