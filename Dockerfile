FROM ghcr.io/containerbase/base:13.25.8@sha256:1e2f3d6e87e9c9c05a963f41ec7609c891b5b4bd35dc9826d57bca4ec82f2422

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.5

RUN install-builder.sh

WORKDIR /src
