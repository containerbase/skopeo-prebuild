FROM ghcr.io/containerbase/base:14.13.2@sha256:690e3a966166453ad571d226336ccc479230bd7da963a6ea6318045822c8c193

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.5

RUN install-builder.sh

WORKDIR /src
