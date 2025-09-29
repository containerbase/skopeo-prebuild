FROM ghcr.io/containerbase/base:13.14.4@sha256:fbfcb06e970a0990eb4dd5c1f6aa8fabbeab733d1472d7c12a3b25b1482e213b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
