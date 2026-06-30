FROM ghcr.io/containerbase/base:14.12.3@sha256:36cd44a81d82db066848d769fa94ea07ebfcf2c5a56ec59707907ea3c1ab38e9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
