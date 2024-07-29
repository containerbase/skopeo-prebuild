#!/bin/bash

set -e

VERSION=${1}

NAME=skopeo
ARCH=$(uname -p)


SEMVER_REGEX="^(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))?(\.(0|[1-9][0-9]*))?([a-z-].*)?$"

function check_semver () {
  if [[ ! "${1}" =~ ${SEMVER_REGEX} ]]; then
    echo Not a semver like version - aborting: "${1}" >&2
    exit 1
  fi
  export MAJOR=${BASH_REMATCH[1]}
  export MINOR=${BASH_REMATCH[3]}
  export PATCH=${BASH_REMATCH[5]}
}


echo "Building ${NAME} ${VERSION} for ${ARCH}"
git checkout --force "v${VERSION}"
DISABLE_DOCS=1 CGO_ENABLED=0 make BUILDTAGS=containers_image_openpgp GO_DYN_FLAGS= bin/skopeo
mkdir -p "/usr/local/${NAME}/${VERSION}/bin"
cp bin/skopeo "/usr/local/${NAME}/${VERSION}/bin/"

/usr/local/${NAME}/"${VERSION}"/bin/skopeo --version
/usr/local/${NAME}/"${VERSION}"/bin/skopeo inspect docker://registry.fedoraproject.org/fedora:latest | jq -r '.Name+"@"+.Digest'

echo "Compressing ${NAME} ${VERSION} for ${ARCH}"
tar -cJf /cache/${NAME}-"${VERSION}"-"${ARCH}".tar.xz -C /usr/local/${NAME} "${VERSION}"
