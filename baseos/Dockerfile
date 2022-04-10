FROM rockylinux:8

# IMAGE INFORMATION
LABEL maintainer="nagatax<4foview@gmail.com>" \
    title="baseos" \
    version="rockylinux" \
    description="This image is base image."

# COMMON SETTING
ENV SRC_DIR="/usr/local/src" \
    INSTALL_DIR="/usr/local" \
    BUILD_DIR="/usr/local/build"

# Change executable user
USER root

RUN set -x; \
    dnf update -y \
    && dnf clean all

# Set a command when system will start
CMD ["/bin/bash"]
