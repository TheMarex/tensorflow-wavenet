#!/bin/sh

set -e

cd "${0%/*}"

MODEL_DIR="s3://wavenet-data/models/wavenet/abstraction_5x2_2048_4s_x5"
OUTPUT_DIR="s3://wavenet-data/outputs/wavenet/abstraction_5x2_2048_4s_x5"
TRAIN_PARAMS="--data_dir=../training/abstraction --sample_size=64000 --logdir=${MODEL_DIR} --gausian_noise=0.01 --batch_size=3 --silence_threshold=0.1 --wavenet_params=../5_2048_double_wavenet_params.json --checkpoint_every 1000 --max_checkpoints=1000"
TRAIN="python ../train.py"
GENERATE_PARAMS="--samples=64000 --wavenet_params=../5_2048_double_wavenet_params.json --wav_seed ../../datasets/breakbeats/essential_breaks_00.wav"
GEN="python ../generate.py"

mkdir -p ../training/abstraction
rm -f ../training/abstraction/*.wav

mkdir -p ../output

cp ../../datasets/breakbeats/essential_breaks_00.wav ../training/abstraction
${TRAIN} --num_steps=1000  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/breakbeats/essential_breaks_01.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_02.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_03.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_04.wav ../training/abstraction
${TRAIN} --num_steps=7500 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-7499 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/breakbeats/essential_breaks_05.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_06.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_07.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_08.wav ../training/abstraction
cp ../../datasets/breakbeats/essential_breaks_09.wav ../training/abstraction
${TRAIN} --num_steps=15000 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-14999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-14999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-14999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-14999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-14999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-14999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

