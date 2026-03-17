FROM ghcr.io/containerbase/base:14.6.5@sha256:ede53d32c4dc8ade2f70d608ddeafe31df26983a5867fafd850d2a35767c8eef

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.1

RUN install-builder.sh

WORKDIR /src
