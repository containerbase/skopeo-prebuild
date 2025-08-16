FROM ghcr.io/containerbase/base:13.10.2@sha256:cce3ca7c45f906da40b2b0e391d4bc7869368f817fca75d031dbba116ce408d8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.0

RUN install-builder.sh

WORKDIR /src
