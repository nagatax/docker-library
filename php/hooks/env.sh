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
## php
export PHP="php"
export PHP_VERSION="8.1.5"
export PHP_PAKAGE="${PHP}-${PHP_VERSION}"
export PHP_PAKAGE_FILE="${PHP}-${PHP_VERSION}.tar.gz"
export PHP_URL="https://www.php.net/distributions/${PHP_PAKAGE_FILE}"
export PHP_SHA256="44d637627746082395d5d3d3d6ae7d71e780b82a8d55a0228887158c4316bf11"
export COMPOSER_SHA="906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8"

# BUILD Setting
export PHP_LATEST="8.1.5"
export D_IMAGE=${PHP}:${PHP_VERSION}