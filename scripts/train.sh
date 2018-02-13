#!/bin/sh

cd "${0%/*}"

mkdir -p ../training/capacity
cp ../../datasets/breakbeats/essential_breaks_00.wav ../training/capacity

python ../train.py --num_steps=1000 --data_dir=../training/capacity --sample_size=64000 --logdir=s3://wavenet-data/models/wavenet/capacity_5_2048_4s --gausian_noise=0.01 --batch_size=4 --silence_threshold=0.1 --wavenet_params=../5_2048_wavenet_params.json
python ../train.py --num_steps=1000 --data_dir=../training/capacity --sample_size=64000 --logdir=s3://wavenet-data/models/wavenet/capacity_5x2_2048_4s --gausian_noise=0.01 --batch_size=4 --silence_threshold=0.1 --wavenet_params=../5_2048_double_wavenet_params.json
python ../train.py --num_steps=1000 --data_dir=../training/capacity --sample_size=64000 --logdir=s3://wavenet-data/models/wavenet/capacity_6_1024_4s --gausian_noise=0.01 --batch_size=4 --silence_threshold=0.1 --wavenet_params=../6_1024_wavenet_params.json
