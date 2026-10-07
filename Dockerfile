FROM ghcr.io/containerbase/base:14.29.0@sha256:ab6470e8abd42d4e19751edee0223085049f3b7f145e6c427fe70a0ddf1c43d1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.27.1

RUN install-builder.sh

WORKDIR /src
