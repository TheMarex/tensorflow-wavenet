#!/bin/bash

set -e

S3_REGION=${S3_REGION:-"us-west-2"}

pushd $HOME

sudo apt update -yy
sudo apt upgrade -yy
sudo apt install -yy virtualenv libasound2-dev htop libcurl4-openssl-dev libssl-dev uuid-dev zlib1g-dev libpulse-dev cmake

virtualenv -p /usr/bin/python3.5 tf

echo "export S3_REGION=${S3_REGION}"
echo "export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64/:${LD_LIBRARY_PATH}" >> ~/.bashrc
echo "export CUDA_HOME=/usr/local/cuda-9.0" >> ~/.bashrc
echo "source ~/tf/bin/activate" >> ~/.bashrc

source ~/tf/bin/activate

pip install magenta-gpu

mkdir -p datasets/breakbeats
aws s3 cp --recursive s3://wavenet-data/datasets/breakbeats datasets/breakbeats

popd
