#!/bin/bash
# Here are some default settings.
# Make sure DOCKER_WORKDIR is created and owned by current user.

# Yocto
YOCTO_VERSION="walnascar"

# Project
PROJECT="yocto-dev-environment"
UPSTREAM="upstream"
WORK="workdir"

GIT_ROOT_DIR=$(git rev-parse --show-toplevel)
CURRENT_PATH="$(realpath ${GIT_ROOT_DIR})" # /workspaces/docker
ROOT_PATH="$(realpath $(dirname ${GIT_ROOT_DIR}))"

echo "Current path: ${CURRENT_PATH}"
echo "Root path: ${ROOT_PATH}"

PROJECT_LOCATION="${CURRENT_PATH}/${PROJECT}"

# Docker
DOCKER_IMAGE_TAG="imx-yocto"
DOCKER_WORKDIR="${PROJECT_LOCATION}"

#SETUP_DIR="${ROOT_PATH}/setup"

# Container
CONF_DIR="${DOCKER_WORKDIR}/${PROJECT}/conf"
UPSTREAM_DIR="${DOCKER_WORKDIR}/${UPSTREAM}"
YOCTO_DIR="${UPSTREAM_DIR}/poky"
WORK_DIR="${DOCKER_WORKDIR}/${WORK}"

BUILD_DIR="${DOCKER_WORKDIR}/build"

# MACHINE="imx8mpevk"
# DISTRO="fsl-imx-xwayland"
# IMAGES="imx-image-core"

# REMOTE="https://github.com/nxp-imx/imx-manifest"
# BRANCH="imx-linux-${YOCTO_VERSION}"
# MANIFEST=${IMX_RELEASE}".xml"