FROM ghcr.io/containerbase/base:13.7.15@sha256:e54355bd55fbc521cbec1d000a57c69649fec92400b00e8b9d82ba2839c9b790

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.0

RUN install-builder.sh

WORKDIR /src
