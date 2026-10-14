FROM ghcr.io/containerbase/base:14.35.0@sha256:aa4760c4d8f0407d740452e0637550596ad2254c29ef4b3da8f5f8867e22d947

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
