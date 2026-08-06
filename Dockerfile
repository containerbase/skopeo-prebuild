FROM ghcr.io/containerbase/base:14.13.14@sha256:24d6b4d809993a73542c9187e858eaa1979ab252e77ea42d32286e592192ba39

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.5

RUN install-builder.sh

WORKDIR /src
