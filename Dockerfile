FROM ghcr.io/containerbase/base:14.10.4@sha256:eb43d25a56098e58171d7a65a2382b9f8b99097f21e7da82626fe6b5016b0c10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.3

RUN install-builder.sh

WORKDIR /src
