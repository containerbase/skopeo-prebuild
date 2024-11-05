FROM ghcr.io/containerbase/base:13.0.5@sha256:7387ee77d85a0a2311a4b692e44a08f04edb3a115f644d7c8f36b770763d699d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.23.2

RUN install-builder.sh

WORKDIR /src
