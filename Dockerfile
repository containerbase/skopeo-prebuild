FROM ghcr.io/containerbase/base:14.3.0@sha256:67cee5cd4d7eceeccd42074c63cc32e0977dcfd7c1662fc5b1efd9dd83147615

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.0

RUN install-builder.sh

WORKDIR /src
