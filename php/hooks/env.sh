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
export PHP_VERSION="8.2.5"
export PHP_PAKAGE="${PHP}-${PHP_VERSION}"
export PHP_PAKAGE_FILE="${PHP}-${PHP_VERSION}.tar.gz"
export PHP_URL="https://www.php.net/distributions/${PHP_PAKAGE_FILE}"
export PHP_SHA256="8974dea2507155471660b13a0bcbdc165ac778eeb845a7dbd65d5ffb92738c0a"
export COMPOSER_SHA="55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae" # see https://getcomposer.org/download/

# BUILD Setting
export PHP_LATEST="8.2.5"
export D_IMAGE=${PHP}:${PHP_VERSION}