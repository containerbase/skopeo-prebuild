FROM ghcr.io/containerbase/base:14.4.10@sha256:76ddcd8525a82ac97a9218f5432b38a195111002923d7bf46ede7319718567d1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.0

RUN install-builder.sh

WORKDIR /src
