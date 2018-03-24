#!/bin/sh

set -e

cd "${0%/*}"

MODEL_DIR="s3://wavenet-data/models/wavenet/abstraction_hiphop_5x2_4096_4s"
OUTPUT_DIR="s3://wavenet-data/outputs/wavenet/abstraction_hiphop_5x2_4096_4s"
TRAIN_PARAMS="--data_dir=../training/abstraction --sample_size=96000 --logdir=${MODEL_DIR} --batch_size=2 --silence_threshold=0.1 --wavenet_params=../5_4096_double_wavenet_params.json --checkpoint_every 10000 --max_checkpoints=1000"
TRAIN="python ../train.py"
SONG_00="hiphop/essential_breaks_00.wav"
SONG_01="hiphop/essential_breaks_01.wav"
SONG_02="hiphop/essential_breaks_02.wav"
SONG_03="hiphop/essential_breaks_03.wav"
SONG_04="hiphop/essential_breaks_04.wav"
SONG_05="hiphop/essential_breaks_05.wav"
SONG_06="hiphop/essential_breaks_06.wav"
SONG_07="hiphop/essential_breaks_07.wav"
SONG_08="hiphop/essential_breaks_08.wav"
SONG_09="hiphop/essential_breaks_09.wav"
SONG_10="hiphop/essential_breaks_10.wav"
SONG_11="hiphop/essential_breaks_11.wav"
SONG_12="hiphop/essential_breaks_12.wav"
SONG_12="hiphop/essential_breaks_12.wav"
SONG_13="hiphop/essential_breaks_13.wav"
SONG_14="hiphop/essential_breaks_14.wav"
SONG_15="hiphop/essential_breaks_15.wav"
SONG_16="hiphop/essential_breaks_16.wav"
SONG_17="hiphop/essential_breaks_17.wav"
SONG_18="hiphop/essential_breaks_18.wav"
SONG_19="hiphop/essential_breaks_19.wav"
SONG_20="hiphop/essential_breaks_20.wav"
GENERATE_PARAMS="--samples=96000 --wavenet_params=../5_4096_double_wavenet_params.json --wav_seed ../generation/abstraction/primer_00.wav"
GEN="python ../generate.py"

mkdir -p ../training/abstraction
mkdir -p ../generation/abstraction
rm -f ../training/abstraction/*.wav
rm -f ../generation/abstraction/*.wav

mkdir -p ../output

cp "../../datasets/${SONG_00}" ../generation/abstraction/primer_00.wav

cp "../../datasets/${SONG_00}" ../training/abstraction
${TRAIN} --num_steps=2000  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.8.wav --temperature 0.8 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_0.9.wav --temperature 0.9 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-1999 ${GENERATE_PARAMS} --wav_out ../output/output_1.0.wav --temperature 1.0 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp "../../datasets/${SONG_01}" ../training/abstraction
cp "../../datasets/${SONG_02}" ../training/abstraction
cp "../../datasets/${SONG_03}" ../training/abstraction
cp "../../datasets/${SONG_04}" ../training/abstraction
cp "../../datasets/${SONG_05}" ../training/abstraction
cp "../../datasets/${SONG_06}" ../training/abstraction
cp "../../datasets/${SONG_07}" ../training/abstraction
cp "../../datasets/${SONG_08}" ../training/abstraction
cp "../../datasets/${SONG_09}" ../training/abstraction
cp "../../datasets/${SONG_10}" ../training/abstraction
${TRAIN} --num_steps=22000  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.8.wav --temperature 0.8 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_0.9.wav --temperature 0.9 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-22000 ${GENERATE_PARAMS} --wav_out ../output/output_1.0.wav --temperature 1.0 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

cp "../../datasets/${SONG_11}" ../training/abstraction
cp "../../datasets/${SONG_12}" ../training/abstraction
cp "../../datasets/${SONG_13}" ../training/abstraction
cp "../../datasets/${SONG_14}" ../training/abstraction
cp "../../datasets/${SONG_15}" ../training/abstraction
cp "../../datasets/${SONG_16}" ../training/abstraction
cp "../../datasets/${SONG_17}" ../training/abstraction
cp "../../datasets/${SONG_18}" ../training/abstraction
cp "../../datasets/${SONG_19}" ../training/abstraction
cp "../../datasets/${SONG_20}" ../training/abstraction
${TRAIN} --num_steps=42000  ${TRAIN_PARAMS}
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.3.wav --temperature 0.3 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.4.wav --temperature 0.4 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.5.wav --temperature 0.5 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.6.wav --temperature 0.6 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.7.wav --temperature 0.7 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.8.wav --temperature 0.8 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_0.9.wav --temperature 0.9 &
CUDA_VISIBLE_DEVICES="" ${GEN} ${MODEL_DIR}/model.ckpt-42000 ${GENERATE_PARAMS} --wav_out ../output/output_1.0.wav --temperature 1.0 &
wait
aws s3 sync ../output ${OUTPUT_DIR}/

