#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:152dc042452c496007f07ca9127571cb9c29697f42acbfad72324b2bb2e43c98 as build-bionic
FROM ubuntu:focal@sha256:71b82b8e734f5cd0b3533a16f40ca1271f28d87343972bb4cd6bd6c38f1bd38e as build-focal
FROM ghcr.io/containerbase/base:10.3.17@sha256:3f58afc059846298e401ec47007917df284a163e653114ffc2b3b8749e95095a AS containerbase

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
RUN install-tool git v2.44.0

COPY bin /usr/local/bin

# renovate: datasource=docker versioning=docker
RUN install-tool golang 1.22.2

RUN install-builder.sh

WORKDIR /src
