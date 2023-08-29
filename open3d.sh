#!/bin/sh

## ubuntu jammy 22.04
apt install sudo git pip cmake

util/install_deps_ubuntu.sh

mkdir build && cd build
cmake ..
make -j4
make install-pip-package
