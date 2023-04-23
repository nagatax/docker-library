#!/bin/sh

##################################################
# 環境変数を定義する
##################################################

# Set shell option
set -eu

# Enable BuildKit
export DOCKER_BUILDKIT=1

# Installing version
export REDIS="redis"
export REDIS_VERSION="7.0.11"
export REDIS_PAKAGE="${REDIS}-${REDIS_VERSION}"
export REDIS_PAKAGE_FILE="${REDIS_PAKAGE}.tar.gz"
export REDIS_URL="http://download.redis.io/releases/${REDIS_PAKAGE_FILE}"

# BUILD Setting
export REDIS_LATEST="7.0.11"
export D_IMAGE=${REDIS}:${REDIS_VERSION}
