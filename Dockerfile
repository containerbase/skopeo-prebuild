FROM ghcr.io/containerbase/base:14.29.1@sha256:6596d3e9d5655acc013f4b2c7bcb1c390281ccd230343de370fe8b206399f14d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
