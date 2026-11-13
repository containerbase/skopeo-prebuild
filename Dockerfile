FROM ghcr.io/containerbase/base:14.66.24@sha256:9d6ab87e0a25f7925ff8e5c262043a1907f2847f9c561372b9d9a9eca6bad843

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.4

RUN install-builder.sh

WORKDIR /src
