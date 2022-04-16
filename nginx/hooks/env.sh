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
## pcre
export PCRE="pcre"
export PCRE_VERSION="8.45"
export PCRE_PAKAGE="${PCRE}-${PCRE_VERSION}"
export PCRE_PAKAGE_FILE="${PCRE_PAKAGE}.tar.gz"
export PCRE_URL="https://sourceforge.net/projects/pcre/files/${PCRE}/${PCRE_VERSION}/${PCRE_PAKAGE_FILE}/download"
export PCRE_SIG_URL="https://sourceforge.net/projects/pcre/files/${PCRE}/${PCRE_VERSION}/${PCRE_PAKAGE_FILE}.sig/download"
## nginx
export NGINX="nginx"
export NGINX_VERSION="1.21.6"
export NGINX_PAKAGE="${NGINX}-${NGINX_VERSION}"
export NGINX_PAKAGE_FILE="${NGINX_PAKAGE}.tar.gz"
export NGINX_URL="https://nginx.org/download/${NGINX_PAKAGE_FILE}"

# BUILD Setting
export NGINX_LATEST="1.21.6"
export D_IMAGE=${NGINX}:${NGINX_VERSION}