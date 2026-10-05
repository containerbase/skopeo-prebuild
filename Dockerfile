FROM ghcr.io/containerbase/base:14.26.1@sha256:668eccb6969c0a803764f7ee197a8c80f047e3e4e5bb554d46a64602804e2c6d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
