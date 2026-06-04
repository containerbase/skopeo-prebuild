FROM ghcr.io/containerbase/base:14.10.22@sha256:182494adbd10ed8df061d5a58fd31a95b7d299c550dc8f6d245a05bb062e833c

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/sbin

# renovate: datasource=golang-version
RUN install-tool golang 1.26.4

RUN install-builder.sh

WORKDIR /src
