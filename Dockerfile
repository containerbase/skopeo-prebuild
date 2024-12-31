FROM ghcr.io/containerbase/base:13.5.7@sha256:627978b5b635e45a463641dd0279650106cb36c70a83eaeba1839088a1e938b6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.4

RUN install-builder.sh

WORKDIR /src
