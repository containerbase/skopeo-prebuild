FROM ghcr.io/containerbase/base:13.19.0@sha256:7fd860079f3e0f2a2421b93184487364db614ff48124861dd6110b5afc68de9c

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.2

RUN install-builder.sh

WORKDIR /src
