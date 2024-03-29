#!/bin/sh

##################################################
# 環境変数を定義する
##################################################

# Set shell option
set -eu

# Enable BuildKit
export DOCKER_BUILDKIT=1

# Installing version
## gcc
export GCC="gcc"
export GCC_VERSION="13.1.0"
export GCC_PAKAGE="${GCC}-${GCC_VERSION}"
export GCC_PAKAGE_FILE="${GCC_PAKAGE}.tar.gz"
export GCC_URL="https://ftp.jaist.ac.jp/pub/GNU/${GCC}/${GCC_PAKAGE}/${GCC_PAKAGE_FILE}"

# BUILD Setting
export GCC_LATEST="13.1.0"
export D_IMAGE=${GCC}:${GCC_VERSION}