#!/bin/sh

set -e

cd "${0%/*}"

MODEL_DIR="s3://wavenet-data/models/wavenet/abstraction_5x2_2048_4s"
OUTPUT_DIR="s3://wavenet-data/outputs/wavenet/abstraction_5x2_2048_4s"
TRAIN_PARAMS="--data_dir=../training/abstraction --sample_size=64000 --logdir=${MODEL_DIR} --gausian_noise=0.01 --batch_size=4 --silence_threshold=0.1 --wavenet_params=../5_2048_double_wavenet_params.json --checkpoint_every 1000 --max_checkpoints=1000"
TRAIN="python ../train.py"
GENERATE_PARAMS="--samples=64000 --wavenet_params=../5_2048_double_wavenet_params.json --wav_seed ../../datasets/breakbeats/essential_breaks_00.wav"
GEN="python ../generate.py"

mkdir -p ../training/abstraction
rm -f ../training/abstraction/*.wav

mkdir -p ../output

cp ../../datasets/breakbeats/essential_breaks_00.wav ../training/abstraction
${TRAIN} --num_steps=500  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/breakbeats/essential_breaks_01.wav ../training/abstraction
${TRAIN} --num_steps=1500  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/breakbeats/essential_breaks_02.wav ../training/abstraction
${TRAIN} --num_steps=3000  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-2999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-2999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-2999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-2999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-2999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/breakbeats/essential_breaks_03.wav ../training/abstraction
${TRAIN} --num_steps=5000 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-4999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-4999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-4999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-4999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-4999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/breakbeats/essential_breaks_04.wav ../training/abstraction
${TRAIN} --num_steps=7500 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8
aws s3 sync ../output ${OUTPUT_DIR}/
