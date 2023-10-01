#!/bin/sh

##################################################
# 環境変数を定義する
##################################################

# Set shell option
set -eu

# Enable BuildKit
export DOCKER_BUILDKIT=1

# Installing version
## php
export PHP="php"
export PHP_VERSION="8.2.11"
export PHP_PAKAGE="${PHP}-${PHP_VERSION}"
export PHP_PAKAGE_FILE="${PHP}-${PHP_VERSION}.tar.gz"
export PHP_URL="https://www.php.net/distributions/${PHP_PAKAGE_FILE}"
export PHP_SHA256="48b1b41279a678a4d4afcd0b256ed921ebf2a91febb0634fdc4449b91c75799f"
export COMPOSER_SHA="e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02" # see https://getcomposer.org/download/

# BUILD Setting
export PHP_LATEST="8.2.11"
export D_IMAGE=${PHP}:${PHP_VERSION}