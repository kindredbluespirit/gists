FROM nvidia/cuda:11.4.3-devel-ubuntu18.04

ENV COLMAP_VERSION=3.7
ENV CMAKE_VERSION=3.21.0
ENV PYTHON_VERSION=3.7.0
ENV OPENCV_VERSION=4.8.0.76
ENV CERES_SOLVER_VERSION=2.0.0

RUN echo "Installing apt packages..." \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt -y update --no-install-recommends \
    && apt -y install --no-install-recommends \
    git \
    wget \
    ffmpeg \
    tk-dev \
    libxi-dev \
    libc6-dev \
    libbz2-dev \
    libffi-dev \
    libomp-dev \
    libssl-dev \
    zlib1g-dev \
    libcgal-dev \
    libgdbm-dev \
    libglew-dev \
    python3-dev \
    python3-pip \
    qtbase5-dev \
    checkinstall \
    libglfw3-dev \
    libeigen3-dev \
    libgflags-dev \
    libxrandr-dev \
    libopenexr-dev \
    libsqlite3-dev \
    libxcursor-dev \
    build-essential \
    libcgal-qt5-dev \
    libxinerama-dev \
    libboost-all-dev \
    libfreeimage-dev \
    libncursesw5-dev \
    libatlas-base-dev \
    libqt5opengl5-dev \
    libgoogle-glog-dev \
    libsuitesparse-dev \
    python3-setuptools \
    libreadline-gplv2-dev \
    && apt autoremove -y \
    && apt clean -y \
    && export DEBIAN_FRONTEND=dialog

## conda and python
RUN apt update && apt install -y wget &&\
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda.sh && \
    /bin/bash /miniconda.sh -b -p /opt/conda &&\
    /opt/conda/condabin/conda init bash &&\
    /opt/conda/bin/conda update -n base -c defaults conda -y &&\
    /opt/conda/bin/conda create -n my -y python=${PYTHON_VERSION} &&\
    echo "conda activate my" >> ~/.bashrc

COPY ../requirements.txt /

RUN bash -il -c "echo \"Installing pip packages...\" \
	&& python3 -m pip install -U pip \
	&& pip3 --no-cache-dir install -r /requirements.txt \
	&& pip3 --no-cache-dir install cmake==${CMAKE_VERSION} opencv-python==${OPENCV_VERSION} \
	&& rm /requirements.txt"

RUN bash -il -c "echo \"Installing Ceres Solver ver. ${CERES_SOLVER_VERSION}...\" \
	&& cd /opt \
	&& git clone https://github.com/ceres-solver/ceres-solver \
	&& cd ./ceres-solver \
	&& git checkout ${CERES_SOLVER_VERSION} \
	&& mkdir ./build \
	&& cd ./build \
	&& cmake ../ -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF \
	&& make -j \
	&& make install"

RUN bash -il -c "echo \"Installing COLMAP ver. ${COLMAP_VERSION}...\" \
	&& cd /opt \
	&& git clone https://github.com/colmap/colmap \
	&& cd ./colmap \
	&& git checkout ${COLMAP_VERSION} \
	&& mkdir ./build \
	&& cd ./build \
	&& cmake ../ \
	&& make -j \
	&& make install \
	&& colmap -h"
