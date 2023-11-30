#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:152dc042452c496007f07ca9127571cb9c29697f42acbfad72324b2bb2e43c98 as build-bionic
FROM ubuntu:focal@sha256:ed4a42283d9943135ed87d4ee34e542f7f5ad9ecf2f244870e23122f703f91c2 as build-focal
FROM ghcr.io/containerbase/base:9.26.0@sha256:d64249bced930342154688a79d0bc537423c2e5918c476361e0e22f5fd734c83 AS containerbase

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
RUN install-tool git v2.43.0

COPY bin /usr/local/bin

# renovate: datasource=docker versioning=docker
RUN install-tool golang 1.21.4

RUN install-builder.sh

WORKDIR /src
