FROM ghcr.io/containerbase/base:13.10.5@sha256:bed98f2dcf0282cefdf3df27a438fadd44b218bb25fe31e09976fafb0ed1359d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.0

RUN install-builder.sh

WORKDIR /src
