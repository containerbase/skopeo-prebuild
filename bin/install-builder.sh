#!/bin/bash

set -e

install-apt \
  build-essential \
  libgpgme-dev \
  libassuan-dev \
  libbtrfs-dev \
  libdevmapper-dev \
  pkg-config \
  ;


git clone https://github.com/containers/skopeo /src
