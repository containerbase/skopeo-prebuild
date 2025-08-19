FROM ghcr.io/containerbase/base:13.10.7@sha256:0e7f67a6279b8236f83956a79486919c9d2d8dd9a0cd4867b9355044cda749e1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.0

RUN install-builder.sh

WORKDIR /src
