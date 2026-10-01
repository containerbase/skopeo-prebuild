FROM ghcr.io/containerbase/base:14.23.0@sha256:81eda1a933a4a0819ea2f2b960499c989e876729b4b871e81b5db5ac9b11e5bb

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
