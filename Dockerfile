FROM ghcr.io/containerbase/base:14.52.7@sha256:ec439441226e331b8cc67f666a7730dd9aa574bab41d6036913097291efc4255

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.3

RUN install-builder.sh

WORKDIR /src
