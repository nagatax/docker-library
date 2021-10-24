#!/bin/sh

##################################################
# 環境変数を定義する
#
# Environment Variables
#  PACKAGE: package name
#  PACKAGE_VERSION: package version
#  PACKAGE_LATEST: latest version of package
#  D_IMAGE: image name of Docker
#  DH_IMAGE: image name of Docker Hub
#  DH_LATEST: latest image name of Docker Hub
##################################################

# Set shell option
set -eu

# Enable BuildKit
export DOCKER_BUILDKIT=1

# Installing version
export PACKAGE=php
export PACKAGE_VERSION=8.0.12
export PACKAGE_LATEST=8.0.12
export PACKAGE_SHA256="a5b78f04a89d3b401465febf449c7ea9de48681f92803dd8dc2bf922812d572b"
export D_IMAGE=${PACKAGE}:${PACKAGE_VERSION}
export COMPOSER_SHA="906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8"