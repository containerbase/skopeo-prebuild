#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:152dc042452c496007f07ca9127571cb9c29697f42acbfad72324b2bb2e43c98 as build-bionic
FROM ubuntu:focal@sha256:874aca52f79ae5f8258faff03e10ce99ae836f6e7d2df6ecd3da5c1cad3a912b as build-focal
FROM ghcr.io/containerbase/base:10.6.0@sha256:d333c18082018277eb616c92b0bec17d6b9d57a7f48629da5072a297d3179f2a AS containerbase

#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ENV BASH_ENV=/usr/local/etc/env
SHELL ["/bin/bash" , "-c"]

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY --from=containerbase /usr/local/bin/ /usr/local/bin/
COPY --from=containerbase /usr/local/containerbase/ /usr/local/containerbase/
RUN install-containerbase

# renovate: datasource=github-tags lookupName=git/git
RUN install-tool git v2.45.0

COPY bin /usr/local/bin

# renovate: datasource=docker versioning=docker
RUN install-tool golang 1.22.2

RUN install-builder.sh

WORKDIR /src
