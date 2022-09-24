#!/bin/sh

##################################################
# 環境変数を定義する
##################################################

# Set shell option
set -eu

# Enable BuildKit
export DOCKER_BUILDKIT=1

# Installing Setting
## apr
export APR="apr"
export APR_VERSION="1.7.0"
export APR_PAKAGE="${APR}-${APR_VERSION}"
export APR_PAKAGE_FILE="${APR_PAKAGE}.tar.gz"
export APR_URL="https://dlcdn.apache.org/${APR}/${APR_PAKAGE_FILE}"
export APR_SHA256="48e9dbf45ae3fdc7b491259ffb6ccf7d63049ffacbc1c0977cced095e4c2d5a2"
## apr-util
export APR_UTIL="apr-util"
export APR_UTIL_VERSION="1.6.1"
export APR_UTIL_PAKAGE="${APR_UTIL}-${APR_UTIL_VERSION}"
export APR_UTIL_PAKAGE_FILE="${APR_UTIL_PAKAGE}.tar.gz"
export APR_UTIL_URL="https://dlcdn.apache.org/${APR}/${APR_UTIL_PAKAGE_FILE}"
export APR_UTIL_SHA256="b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
## pcre
export PCRE="pcre"
export PCRE_VERSION="8.45"
export PCRE_PAKAGE="${PCRE}-${PCRE_VERSION}"
export PCRE_PAKAGE_FILE="${PCRE_PAKAGE}.tar.gz"
export PCRE_URL="https://sourceforge.net/projects/pcre/files/${PCRE}/${PCRE_VERSION}/${PCRE_PAKAGE_FILE}/download"
## apache
export APACHE="httpd"
export APACHE_VERSION="2.4.54"
export APACHE_PAKAGE="${APACHE}-${APACHE_VERSION}"
export APACHE_PAKAGE_FILE="${APACHE_PAKAGE}.tar.gz"
export APACHE_URL="https://dlcdn.apache.org/${APACHE}/${APACHE_PAKAGE_FILE}"
export APACHE_SHA256="c687b99c446c0ef345e7d86c21a8e15fc074b7d5152c4fe22b0463e2be346ffb"

# BUILD Setting
export APACHE_LATEST="2.4.54"
export D_IMAGE=${APACHE}:${APACHE_VERSION}