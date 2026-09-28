FROM ghcr.io/containerbase/base:14.20.0@sha256:011611275bdcd448f850a5b79644d21a23828ada52b5c70bceb0778f4cb3c35d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
