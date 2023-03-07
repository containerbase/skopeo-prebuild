#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:1e32b9c52e8f22769df41e8f61066c77b2b35b0a423c4161c0e48eca2fd24f75 as build-bionic
FROM ubuntu:focal@sha256:9fa30fcef427e5e88c76bc41ad37b7cc573e1d79cecb23035e413c4be6e476ab as build-focal
FROM containerbase/buildpack:6.3.6@sha256:35e2f15c28984e853631e6259cf780b0565ad307e6fa032ce18c510b7f6aead8 AS buildpack

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
RUN install-tool git v2.39.2

COPY bin /usr/local/bin

# renovate: datasource=docker depName=golang versioning=docker
RUN install-tool golang 1.18.2

RUN install-builder.sh

WORKDIR /src
