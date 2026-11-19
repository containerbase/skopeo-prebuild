FROM ghcr.io/containerbase/base:14.68.0@sha256:6b90a46537d7fb06c6b84b48563091fe011d58135cc105a5b4fa4892c4a2aa01

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.4

RUN install-builder.sh

WORKDIR /src
