#!/bin/bash

EXCLUDE_PATH="../../Data/exclude_coords.bed"
DATA_DIR="../../Data/K562"
GD_PREFIX="K562"
GD_SUFFIX="genomedata"

segway \
 --resolution=10 \
 --num-instances=10 \
 --minibatch-fraction=0.01 \
 --num-labels=10 \
 --max-train-rounds=10 \
 --exclude-coords=${EXCLUDE_PATH} \
 --recover="train_results_old" \
 --observations="train_results_old/observations" \
 train \
 ${DATA_DIR}/${GD_PREFIX}_DNaseIStam.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Srf.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Nrsf.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Gabp.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k4me3.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k27me3.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k27ac.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k36me3.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H4k20me1.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k9me1.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k4me2.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k4me1.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_H3k9ac.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Pol2b.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Ctcf.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Xrcc4.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Nfe2.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Jund.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Cmyc.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Max.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Cfos.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Cjun.${GD_SUFFIX} \
 ${DATA_DIR}/${GD_PREFIX}_Rad21.${GD_SUFFIX} \
  train_results
