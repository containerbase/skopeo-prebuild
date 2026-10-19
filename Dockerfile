FROM ghcr.io/containerbase/base:14.44.0@sha256:ef358c45da28f32a73490091a38d5731492812aeea5b57b9aeb6c60a9c5255d2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.2

RUN install-builder.sh

WORKDIR /src
