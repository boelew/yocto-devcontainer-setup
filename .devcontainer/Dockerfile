# DOCKERFILE : yocto-scarthgap-ubuntu-22
# AUTHOR     : Flint Weller
# PURPOSE    : Provide a known Ubuntu 22.04 LTS "Jammy" environment
#              for building NXP iMX Embedded Linux
#              or NXP LLDP (Layerscape Linux Distribution PoC)
#              using Yocto Project 5.0 "scarthgap"
# ----------------------------------------------------------------------
# INSTRUCTIONS
#
# Create Docker image from this dockerfile with command:
# $ docker build --no-cache \
#     --file ${HOME}/Tools/dockerfiles/yocto-scarthgap-ubuntu-22 \
#     --tag yocto-scarthgap-ubuntu-22 .
#
# Deploy a container with the working directory mounted
# SYNTAX   :
# $ docker run -dit -P --hostname DockerHostname --name DockerContainerName \
#     -v HostDirectory:DockerDirectory DockerImageName
# EXAMPLE  :
# $ docker run -dit -P --hostname docker-scarthgap --name imx8-scarthgap \
#     -v /work/docker/scarthgap:/home/build yocto-scarthgap-ubuntu-22
#
# ----------------------------------------------------------------------
# Ubuntu LTS release version numbers with code names
#
# Ubuntu 24.04 LTS = Noble Numbat
# Ubuntu 22.04 LTS = Jammy Jellyfish
# Ubuntu 20.04 LTS = Focal Fossa
# Ubuntu 18.04 LTS = Bionic Beaver
# Ubuntu 16.04 LTS = Xenial Xerus
# Ubuntu 14.04 LTS = Trusty Tahr
#
# ----------------------------------------------------------------------
# Yocto Project version numbers, codenames, and status
#
# #.# CodeName    Status EOL-Date
# 5.2 Walnascar   TBD
# 5.1 Styhead     Active 2025 May
# 5.0 Scarthgap   LTS    2028 April
# 4.3 Nanbield    EOL    2024 May
# 4.2 Mickledore  EOL    2023 November
# 4.1 Langdale    EOL
# 4.0 Kirkstone   LTS    2026 April
# 3.4 Honister    EOL
# 3.3 Hardknott   EOL
# 3.2 Gatesgarth  EOL
# 3.1 Dunfell     EOL    2024 April
# 3.0 Zeus        EOL
#
# ----------------------------------------------------------------------
# NOTE: NXP now has instructions on building a dockerfile
# https://github.com/nxp-imx/imx-docker
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# FROM must be the first command in a dockerfile
# Specify Ubuntu digest to pull from
FROM ubuntu:24.04
# Could instead use FROM ubuntu:22.04


# ----------------------------------------------------------------------
# Use DEBIAN_FRONTEND=noninteractive to avoid image build hang waiting
# for a default confirmation [Y/n] at some configurations.
ENV DEBIAN_FRONTEND=noninteractive


# ----------------------------------------------------------------------
# Install dependencies
RUN apt update && apt upgrade -y


# ----------------------------------------------------------------------
# Handle the tzdata prompt
RUN ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends tzdata


# ----------------------------------------------------------------------
# Put everything we want to install here
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends --fix-missing \
    apt-utils \
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    file \
    gawk \
    gcc \
    git \
    iputils-ping \
    libacl1 \
    liblz4-tool \
    libsdl1.2-dev \
    locales \
    python3 \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    python3-subunit \
    socat \
    sudo \
    tar \
    texinfo \
    unzip \
    vim \
    wget \
    xz-utils \
    zlib1g-dev \
    zstd

# ----------------------------------------------------------------------
# Clean up after the installs
RUN DEBIAN_FRONTEND=noninteractive apt clean -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# ----------------------------------------------------------------------
# Set up locales
RUN locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8


# ----------------------------------------------------------------------
# Yocto requires the source command for setting up the build environment, so
# Replace dash with bash (Ubuntu uses dash as /bin/sh for system shells)
# https://wiki.ubuntu.com/DashAsBinSh
# Note that using && below to chain commands is essential to avoid failure
RUN rm /bin/sh && ln -s bash /bin/sh


# ----------------------------------------------------------------------
# Install the google repo utility
#RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo
#ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
#RUN chmod 755 /usr/local/bin/repo


# ----------------------------------------------------------------------
# Create user called build (because we can not run Yocto Project as root)
# Change uid and gid, to match my account on my workstation
# Username is not all that important
ENV UID=1000
ENV GID=1000
ENV USER=ubuntu

# Ubuntu 22.04
#RUN groupadd -g $GID $USER && \
#    useradd -u $UID -g $GID -ms /bin/bash $USER && \
#    usermod -a -G sudo $USER && \
#    usermod -a -G users $USER

# Ubuntu 24.04
RUN usermod -a -G sudo $USER && \
    usermod -a -G users $USER

# ----------------------------------------------------------------------
# Add user to sudoers
ARG USER
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}


# ----------------------------------------------------------------------
# Change username and work directory
USER $USER
WORKDIR /home/$USER