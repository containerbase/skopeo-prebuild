FROM ghcr.io/containerbase/base:14.11.4@sha256:53ad1cfcf61e6c6d51fcef4398a47276390086d79e90bc55a4f915c4cdf3f425

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
