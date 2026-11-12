FROM ghcr.io/containerbase/base:14.66.20@sha256:3971d420e05e89ff94a4ff33fc91e44445717eadb5716e321d5ffd0ac2d68090

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.4

RUN install-builder.sh

WORKDIR /src
