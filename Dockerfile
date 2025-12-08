FROM ghcr.io/containerbase/base:13.25.11@sha256:9b93a1a8774314e59e286a59fe332577b784b587c66cb68ab12e9101a7e98155

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.5

RUN install-builder.sh

WORKDIR /src
