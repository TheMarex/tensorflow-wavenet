#!/bin/sh

set -e

cd "${0%/*}"

MODEL_DIR="s3://wavenet-data/models/wavenet/abstraction_5x2_2048_4s"
OUTPUT_DIR="s3://wavenet-data/outputs/wavenet/abstraction_5x2_2048_4S"
TRAIN_PARAMS="--data_dir=../training/capacity --sample_size=64000 --logdir=${MODEL_DIR} --gausian_noise=0.01 --batch_size=2 --silence_threshold=0.1 --wavenet_params=../5_2048_double_wavenet_params.json --checkpoint_every 1000 --max_checkpoints=1000"
GENERATE_PARAMS="--samples=64000 --wavenet_params=../5_2048_double_wavenet_params.json --wav_seed ../../datasets/breakbeats/essential_breaks_00.wav --wav_out output.wav"

mkdir -p ../training/abstraction
rm -f ../training/abstraction/*.wav

cp ../../datasets/breakbeats/essential_breaks_00.wav ../training/abstraction
python ../train.py --num_steps=1000  ${TRAIN_PARAMS}
python ../generate.py ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}
aws s3 cp output_999.wav ${OUTPUT_DIR}

cp ../../datasets/breakbeats/essential_breaks_01.wav ../training/abstraction
python ../train.py --num_steps=3000  ${TRAIN_PARAMS}
python ../generate.py ${MODEL_DIR}/model.ckpt-2999 ${GENERATE_PARAMS}
aws s3 cp output_2999.wav ${OUTPUT_DIR}
