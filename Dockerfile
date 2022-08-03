#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:eb1392bbdde63147bc2b4ff1a4053dcfe6d15e4dfd3cce29e9b9f52a4f88bc74 as build-bionic
FROM ubuntu:focal@sha256:af5efa9c28de78b754777af9b4d850112cad01899a5d37d2617bb94dc63a49aa as build-focal
FROM containerbase/buildpack:4.8.2@sha256:bcdcbdc376bea0f072db7f39f2d49d6741994bdb794837279f8a46268d04374c AS buildpack

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
RUN install-tool git v2.37.1

COPY bin /usr/local/bin

# renovate: datasource=docker depName=golang versioning=docker
RUN install-tool golang 1.18.2

RUN install-builder.sh

WORKDIR /src
