FROM ghcr.io/containerbase/base:14.10.20@sha256:87954976479f60a14ee0728d6f5716ba6a2739df3f45257cebb1e1f2b28df481

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.3

RUN install-builder.sh

WORKDIR /src
