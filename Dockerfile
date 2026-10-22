FROM ghcr.io/containerbase/base:14.51.0@sha256:c3013bce36bfc1a18310e7fddc87ddc27468eb2ac86007ce1f189d93e5a0dabb

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
