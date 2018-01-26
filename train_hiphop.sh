#!/bin/sh

python train.py --data_dir=../sounds/hiphop --sample_size=16000 --logdir=./logdir/train/hiphop_16k_3_4096 --checkpoint_every=5000 --max_checkpoints=20 --batch_size=6 --silence_threshold=0.1 --histograms=True --wavenet_params=./hiphop_3_4096_wavenet_params.json --l2_regularization_strength=0.2 --learning_rate=0.001

