FROM ghcr.io/containerbase/base:14.15.2@sha256:04525ed6b7e61f56e81948ff3079f2e48ca4a874c6d73369f0b5ad0cbe01dcd4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
