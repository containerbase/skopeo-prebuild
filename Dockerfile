FROM ghcr.io/containerbase/base:13.13.13@sha256:6cc24e0aa68eba203af1fea5448c24bc6a7248109b1b64964e116bc9aee1258a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
