#!/bin/bash

set -e

install-apt \
  libgpgme-dev \
  libassuan-dev \
  libbtrfs-dev \
  libdevmapper-dev \
  pkg-config \
  ;


git clone https://github.com/containers/skopeo /src
