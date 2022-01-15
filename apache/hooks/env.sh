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
export PACKAGE_VERSION=2.4.52
export PACKAGE_LATEST=2.4.52
export PACKAGE_SHA256="296c74a8adde1a8acd6617b21fc3d19719ff4fa39319b2bdbd898aca4d5df97f"
export D_IMAGE=${PACKAGE}:${PACKAGE_VERSION}
