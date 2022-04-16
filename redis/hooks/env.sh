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
export REDIS="redis"
export REDIS_VERSION="6.2.6"
export REDIS_PAKAGE="${REDIS}-${REDIS_VERSION}"
export REDIS_PAKAGE_FILE="${REDIS_PAKAGE}.tar.gz"
export REDIS_URL="http://download.redis.io/releases/${REDIS_PAKAGE_FILE}"

# BUILD Setting
export REDIS_LATEST="6.2.6"
export D_IMAGE=${REDIS}:${REDIS_VERSION}
