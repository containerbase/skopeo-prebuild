#!/bin/bash

set -e

install-apt \
  build-essential \
  jq \
  libgpgme-dev \
  libassuan-dev \
  libbtrfs-dev \
  libdevmapper-dev \
  pkg-config \
  ;

git config --global advice.detachedHead false

git clone https://github.com/containers/skopeo /src
