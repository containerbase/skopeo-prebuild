FROM ghcr.io/containerbase/base:14.12.6@sha256:81cbdbae23b4f50558958db04c76939e685e0ac663f6bc38068834c734c7494b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.5

RUN install-builder.sh

WORKDIR /src
