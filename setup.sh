#!/bin/bash

set -e

S3_REGION=${S3_REGION:-"us-west-2"}

pushd $HOME

echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
sudo add-apt-repository ppa:ubuntu-toolchain-r/test

sudo apt update -yy
sudo apt upgrade -yy

sudo apt install -yy openjdk-8-jdk virtualenv libasound2-dev htop python3-dev bazel libjemalloc-dev g++-6 libcurl4-openssl-dev libssl-dev uuid-dev zlib1g-dev libpulse-dev cmake
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6

virtualenv -p /usr/bin/python3.5 tf

echo "export S3_REGION=${S3_REGION}"
echo "export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64/:${LD_LIBRARY_PATH}" >> ~/.bashrc
echo "export CUDA_HOME=/usr/local/cuda-9.0" >> ~/.bashrc
echo "source ~/tf/bin/activate" >> ~/.bashrc

source ~/.bashrc

git clone https://github.com/aws/aws-sdk-cpp.git
pushd aws-sdk-cpp
mkdir build
pushd build
cmake ..  -DBUILD_ONLY="s3" -DCMAKE_BUILD_TYEPE=Relase -DAUTORUN_UNIT_TESTS=Off -DENABLE_TESTING=Off
make -j4
sudo make install
popd
popd

pip install numpy

git clone https://github.com/tensorflow/tensorflow
pushd tensorflow
git checkout r1.5
./configure
bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
sudo pip install /tmp/tensorflow_pkg/*.whl
popd

mkdir datasets
aws s3 cp --recusrive s3://wavenet-data/datasets/breakbeats datasets

pushd tensorflow-wavenet
./train.sh
popd

popd
