#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/../common/project-setup.sh

echo "Build path: ${BUILD_DIR}"
source ${UPSTREAM_DIR}/poky/oe-init-build-env ${BUILD_DIR}