FROM ghcr.io/containerbase/base:13.7.18@sha256:76a6046635887b05412d17395c2472636805e0d63aca754acb3437c35bb49f7f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.0

RUN install-builder.sh

WORKDIR /src
