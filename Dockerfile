FROM ghcr.io/containerbase/base:13.10.21@sha256:19e1caafaa0c8f61f1c7cc65581cb16f8335af12f40ef1e47dff06958bbbabfb

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
