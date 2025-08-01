FROM ghcr.io/containerbase/base:13.8.62@sha256:d23cceb013806fbcd4c22b5f876c42be1045f1f3e0c035eade6546cd7f17c8fc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.5

RUN install-builder.sh

WORKDIR /src
