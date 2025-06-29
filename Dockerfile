FROM ghcr.io/containerbase/base:13.8.45@sha256:229f1eb2c28a19db071876e68402b550721faaeb92252e35a816e97328dca511

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.24.4

RUN install-builder.sh

WORKDIR /src
