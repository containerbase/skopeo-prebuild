FROM ghcr.io/containerbase/base:13.8.4@sha256:ff6cce683adb490f9a55c3d02e9ace6d1044987a8747f5b3dd58eef2ab341dc9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.0

RUN install-builder.sh

WORKDIR /src
