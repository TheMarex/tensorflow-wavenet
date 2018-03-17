#!/bin/sh

set -e

cd "${0%/*}"

MODEL_DIR="s3://wavenet-data/models/wavenet/abstraction_publicenemey_5x2_2048_4s"
OUTPUT_DIR="s3://wavenet-data/outputs/wavenet/abstraction_publicenemey_5x2_2048_4s"
TRAIN_PARAMS="--data_dir=../training/abstraction --sample_size=64000 --logdir=${MODEL_DIR} --batch_size=3 --silence_threshold=0.1 --wavenet_params=../5_2048_double_wavenet_params.json --checkpoint_every 1000 --max_checkpoints=1000"
TRAIN="python ../train.py"
SONG_00="publicenemy/Public Enemy - Don't Believe The Hype.wav"
SONG_01="publicenemy/Public Enemy - Can't Truss It.wav"
SONG_02="publicenemy/Public Enemy - Bring The Noise.wav"
SONG_03="publicenemy/Public Enemy - Rebel Without A Pause.wav"
GENERATE_PARAMS="--samples=64000 --wavenet_params=../5_2048_double_wavenet_params.json --wav_seed ../../datasets/${SONG_00}"
GEN="python ../generate.py"

mkdir -p ../training/abstraction
rm -f ../training/abstraction/*.wav

mkdir -p ../output

cp ../../datasets/${SONG_00} ../training/abstraction
${TRAIN} --num_steps=10000  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-9999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-9999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-9999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-9999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-9999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-9999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/${SONG_01} ../training/abstraction
${TRAIN} --num_steps=20000 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-19999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-19999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-19999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-19999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-19999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-19999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/${SONG_02} ../training/abstraction
${TRAIN} --num_steps=30000 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-29999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-29999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-29999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-29999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-29999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-29999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp ../../datasets/${SONG_03} ../training/abstraction
${TRAIN} --num_steps=40000 ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-39999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-39999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-39999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-39999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-39999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-39999 ${GENERATE_PARAMS}  --wav_out ../output/output_0.8.wav --temperature 0.8 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

