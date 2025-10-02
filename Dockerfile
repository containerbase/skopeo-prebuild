FROM ghcr.io/containerbase/base:13.14.7@sha256:6897c20b12c0fd277fc8bfef2275ca4ebef20baa8f3802cc017f240cb9abfd26

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
