FROM ghcr.io/containerbase/base:13.8.52@sha256:a77ff546359430da174457c545a4e29e04408fe88bb4500be85797ef11767559

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
