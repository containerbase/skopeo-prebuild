FROM ghcr.io/containerbase/base:14.22.0@sha256:4471600a646738416f4491bf451bb6b356e0bdc87702ea99a4eada843cd3342b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
