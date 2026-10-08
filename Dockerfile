FROM ghcr.io/containerbase/base:14.30.1@sha256:5634e9236b1848031671a49b3c17e2f29689e68b8d42427cac403168cdb1997f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
