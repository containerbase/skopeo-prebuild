FROM ghcr.io/containerbase/base:14.10.25@sha256:1e0c0f168566861b19eafcac956b46d24ccf608cbb128d16b53b8d53657b5819

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
