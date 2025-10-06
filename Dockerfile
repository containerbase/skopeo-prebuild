FROM ghcr.io/containerbase/base:13.16.0@sha256:4321d65cfa5fcce381fb9c8af9ee829249d45277b08f27cee2b9e7a4d019ea1d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
