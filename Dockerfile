FROM ghcr.io/containerbase/base:14.57.0@sha256:776c077dd0534c22637fd7d8426533e56e8b616d9b4c555f1ca96bc6a08f853a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
