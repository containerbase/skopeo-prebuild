FROM ghcr.io/containerbase/base:13.8.46@sha256:2718850f952fff28ef8c4ce58416f1dd4fb42a4042020766d5d6ac6e24e61bda

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
