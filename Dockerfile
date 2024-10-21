FROM ghcr.io/containerbase/base:12.0.10@sha256:30b853b224d0c644371c30de69ddde13edf6077376c8b17d48633d94be5b7c38

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.2

RUN install-builder.sh

WORKDIR /src
