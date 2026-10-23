FROM ghcr.io/containerbase/base:14.52.0@sha256:ea18b24a88bf0e155bba8fe5cf2766f044356c306fe9112312de54459943b3dd

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
