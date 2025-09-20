FROM ghcr.io/containerbase/base:13.13.9@sha256:abf41bd07f1aecd460395506c26f1c39623ca60fa61f83a3b6684b91a691fea9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.25.1

RUN install-builder.sh

WORKDIR /src
