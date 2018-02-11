#!/bin/sh

mkdir -p training/capacity
cp ../sounds/hiphop/essential_breaks_00.wav training/capacity

python train.py --num_steps=1000 --data_dir=../sounds/test --sample_size=64000 --logdir=s3://wavenet-data/models/wavenet/capacity_5_2048_4s --gausian_noise=0.01 --batch_size=4 --silence_threshold=0.1 --wavenet_params=./hiphop_5_2048_wavenet_params.json
python train.py --num_steps=1000 --data_dir=../sounds/test --sample_size=64000 --logdir=s3://wavenet-data/models/wavenet/capacity_6_1024_4s --gausian_noise=0.01 --batch_size=4 --silence_threshold=0.1 --wavenet_params=./hiphop_5_2048_wavenet_params.json
