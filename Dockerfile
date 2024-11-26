FROM ghcr.io/containerbase/base:13.0.22@sha256:9cb70d95d15d4c5f436e6c66e159f2c554b81b4ec8bf0c43343622fc7e9720e7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.3

RUN install-builder.sh

WORKDIR /src
