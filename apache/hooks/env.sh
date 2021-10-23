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
export PACKAGE=httpd
export PACKAGE_VERSION=2.4.51
export PACKAGE_LATEST=2.4.51
export PACKAGE_SHA256="c2cedb0b47666bea633b44d5b3a2ebf3c466e0506955fbc3012a5a9b078ca8b4"
export D_IMAGE=${PACKAGE}:${PACKAGE_VERSION}
