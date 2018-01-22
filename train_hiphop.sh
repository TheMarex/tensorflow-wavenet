#!/bin/sh

#python train.py --data_dir=../sounds/hiphop --sample_size=96000 --logdir=./logdir/train/hiphop_16k_6_2048 --checkpoint_every=5000 --max_checkpoints=20 --normalize_peak=True --batch_size=1 --silence_threshold=0.1 --histograms=True
python train.py --data_dir=../sounds/hiphop --sample_size=96000 --logdir=./logdir/train/hiphop_16k_3_4096_real --checkpoint_every=5000 --max_checkpoints=20 --normalize_peak=True --batch_size=1 --silence_threshold=0.1 --histograms=True --wavenet_params=./hiphop_3_4096_real_wavenet_params.json

