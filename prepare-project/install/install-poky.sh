source ./prepare-project/common/project-setup.sh

# Navigate to workdir
echo "mkdir -p ${YOCTO_DIR}"
mkdir -p ${YOCTO_DIR}
echo "mkdir -p ${UPSTREAM_DIR}"
mkdir -p ${UPSTREAM_DIR}
echo "mkdir -p ${WORK_DIR}"
mkdir -p ${WORK_DIR}
echo "mkdir -p ${BUILD_DIR}"
mkdir -p ${BUILD_DIR}

cd ${UPSTREAM_DIR};

# Clone Yocto
git clone git://git.yoctoproject.org/poky;

cd poky;

# Checkout yocto version
git checkout -t origin/${YOCTO_VERSION} -b ${YOCTO_VERSION};
git pull;

# Navigate back to where this project resides
cd ${WORK_DIR};

echo "cp -r ${CURRENT_PATH}/prepare-project/conf ${BUILD_DIR}"
cp -r ${CURRENT_PATH}/prepare-project/conf ${BUILD_DIR}

echo "cp -r ${CURRENT_PATH}/prepare-project/common ${WORK_DIR}"
cp -r ${CURRENT_PATH}/prepare-project/common ${WORK_DIR}

echo "cp -r ${CURRENT_PATH}/prepare-project/conf ${WORK_DIR}"
cp -r ${CURRENT_PATH}/prepare-project/conf ${WORK_DIR}

echo "cp -r ${CURRENT_PATH}/prepare-project/scripts ${WORK_DIR}"
cp -r ${CURRENT_PATH}/prepare-project/scripts ${WORK_DIR}

# set execute flag
chmod +x ${WORK_DIR}/scripts/yocto_shell.sh

echo "mkdir -p layers"
mkdir -p ${WORK_DIR}/layers