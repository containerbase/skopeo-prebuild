FROM ghcr.io/containerbase/base:13.23.17@sha256:b7bedc98c46e80c2a753c1c5aa069d9696200bda607100b7ef9a522c76d578cc

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.3

RUN install-builder.sh

WORKDIR /src
