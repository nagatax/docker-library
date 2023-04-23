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
export APR_VERSION="1.7.4"
export APR_PAKAGE="${APR}-${APR_VERSION}"
export APR_PAKAGE_FILE="${APR_PAKAGE}.tar.gz"
export APR_URL="https://dlcdn.apache.org/${APR}/${APR_PAKAGE_FILE}"
export APR_SHA256="a4137dd82a185076fa50ba54232d920a17c6469c30b0876569e1c2a05ff311d9"
## apr-util
export APR_UTIL="apr-util"
export APR_UTIL_VERSION="1.6.3"
export APR_UTIL_PAKAGE="${APR_UTIL}-${APR_UTIL_VERSION}"
export APR_UTIL_PAKAGE_FILE="${APR_UTIL_PAKAGE}.tar.gz"
export APR_UTIL_URL="https://dlcdn.apache.org/${APR}/${APR_UTIL_PAKAGE_FILE}"
export APR_UTIL_SHA256="2b74d8932703826862ca305b094eef2983c27b39d5c9414442e9976a9acf1983"
## pcre
export PCRE="pcre"
export PCRE_VERSION="8.45"
export PCRE_PAKAGE="${PCRE}-${PCRE_VERSION}"
export PCRE_PAKAGE_FILE="${PCRE_PAKAGE}.tar.gz"
export PCRE_URL="https://sourceforge.net/projects/pcre/files/${PCRE}/${PCRE_VERSION}/${PCRE_PAKAGE_FILE}/download"
## apache
export APACHE="httpd"
export APACHE_VERSION="2.4.57"
export APACHE_PAKAGE="${APACHE}-${APACHE_VERSION}"
export APACHE_PAKAGE_FILE="${APACHE_PAKAGE}.tar.gz"
export APACHE_URL="https://dlcdn.apache.org/${APACHE}/${APACHE_PAKAGE_FILE}"
export APACHE_SHA256="bc3e7e540b83ec24f9b847c6b4d7148c55b79b27d102e21227eb65f7183d6b45"

# BUILD Setting
export APACHE_LATEST="2.4.57"
export D_IMAGE=${APACHE}:${APACHE_VERSION}