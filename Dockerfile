FROM ghcr.io/containerbase/base:13.8.39@sha256:efbc9e44c03167c9fa03f91d85ffee522b5cd151b9e5ef98af1fd202307925c7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
