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
## gcc
export GCC="gcc"
export GCC_VERSION="11.2.0"
export GCC_PAKAGE="${GCC}-${GCC_VERSION}"
export GCC_PAKAGE_FILE="${GCC_PAKAGE}.tar.gz"
export GCC_URL="https://ftp.jaist.ac.jp/pub/GNU/${GCC}/${GCC_PAKAGE}/${GCC_PAKAGE_FILE}"

# BUILD Setting
export GCC_LATEST="11.2.0"
export D_IMAGE=${GCC}:${GCC_VERSION}