FROM ghcr.io/containerbase/base:14.6.21@sha256:994ad45621589b8a96711db8a5dcaddae8d0d17931780c99bcdf65ba16dbe443

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.2

RUN install-builder.sh

WORKDIR /src
