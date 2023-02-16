#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:a3765b4d74747b5e9bdd03205b3fbc4fa19a02781c185f97f24c8f4f84ed7bbf as build-bionic
FROM ubuntu:focal@sha256:4a45212e9518f35983a976eead0de5eecc555a2f047134e9dd2cfc589076a00d as build-focal
FROM containerbase/buildpack:6.1.4@sha256:84ac72438f0d9a39ab820b009c1ae3c75e322e334b5249a5fc9f75c928712fbf AS buildpack

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
