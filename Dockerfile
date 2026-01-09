FROM ghcr.io/containerbase/base:13.25.22@sha256:79df8a799b38482a59d6847aff950e78228a8e5b776fad4e363742e590984dfc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.5

RUN install-builder.sh

WORKDIR /src
