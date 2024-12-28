FROM ghcr.io/containerbase/base:13.5.5@sha256:b65aebe9e5536561185841e030f822fd7ba4266ef8fcc5680b00f0d48cb441f9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
