FROM ghcr.io/containerbase/base:13.8.9@sha256:41b3e7db52a4f638d0f6c9241844d55dcaac465eed951b6e44c72edddeab780b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.2

RUN install-builder.sh

WORKDIR /src
