FROM ghcr.io/containerbase/base:13.0.25@sha256:703d5833b6625642ecd2122a702b427e2bcb187d63bc83bc482fa0b3f80e6f81

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.3

RUN install-builder.sh

WORKDIR /src
