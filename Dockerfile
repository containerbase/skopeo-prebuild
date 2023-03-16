#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:8aa9c2798215f99544d1ce7439ea9c3a6dfd82de607da1cec3a8a2fae005931b as build-bionic
FROM ubuntu:focal@sha256:9fa30fcef427e5e88c76bc41ad37b7cc573e1d79cecb23035e413c4be6e476ab as build-focal
FROM ghcr.io/containerbase/base:6.4.2@sha256:b96338a772df279c5c83b0df418525d553045cb706205f75019272d4701026da AS buildpack

#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ENV BASH_ENV=/usr/local/etc/env
SHELL ["/bin/bash" , "-c"]

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY --from=buildpack /usr/local/bin/ /usr/local/bin/
COPY --from=buildpack /usr/local/buildpack/ /usr/local/buildpack/
RUN install-buildpack

# renovate: datasource=github-tags lookupName=git/git
RUN install-tool git v2.40.0

COPY bin /usr/local/bin

# renovate: datasource=docker depName=golang versioning=docker
RUN install-tool golang 1.18.2

RUN install-builder.sh

WORKDIR /src
