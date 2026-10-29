FROM ghcr.io/containerbase/base:14.56.1@sha256:fd71caad82ca393415902b4c7f294fc51668b8800524117ee75d5317dff52ee9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
