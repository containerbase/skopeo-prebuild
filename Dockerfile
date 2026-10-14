FROM ghcr.io/containerbase/base:14.38.0@sha256:996d6e23c0eb3f712d127543d73fef84f1dd7997b9f57b929f29c421a3c19e1e

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
