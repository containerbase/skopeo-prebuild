FROM ghcr.io/containerbase/base:13.23.10@sha256:03cd965862ad066be8906e4b382aedf8758bcff1883b6be3ff1288f8058a200f

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.3

RUN install-builder.sh

WORKDIR /src
