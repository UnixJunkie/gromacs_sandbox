#!/bin/bash

set -u

# install deps on ubuntu, as of Sep 2024
sudo apt install gcc-12 g++-12 nvidia-cuda-toolkit-gcc

# cleanup
rm -rf build
mkdir build
cd build

# configure
cmake ../ \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_CXX_COMPILER=g++-12 -DCMAKE_C_COMPILER=gcc-12 \
      -DGMX_GPU=CUDA

# build
make -j 12

# test
make -k -j12 check

# install
sudo make install
