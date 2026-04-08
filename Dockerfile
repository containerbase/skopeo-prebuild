FROM ghcr.io/containerbase/base:14.6.17@sha256:eec8acbb0bc840962127caaf9512e3511ea3ab3638b9403efd7c4971d9d21f2c

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.2

RUN install-builder.sh

WORKDIR /src
