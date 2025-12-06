FROM ghcr.io/containerbase/base:13.25.9@sha256:cb6a8d374845f1c8b8fb3952d1c280575ab6b382bc4b5c1cf00b35fd4dbfbc54

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.5

RUN install-builder.sh

WORKDIR /src
