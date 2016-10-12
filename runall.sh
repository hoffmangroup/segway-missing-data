#!/bin/bash

BW2BG_ID=$(qsub -q hoffmangroup -cwd -N bw2bg_K562 sub_bigWigToBedGraph.sh)
BW2BG_ID=$(echo ${BW2BG_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

UMAP_ID=$(qsub -q hoffmangroup -cwd -N umap_K562 -hold_jid ${BW2BG_ID} sub_umap.sh)
UMAP_ID=$(echo ${UMAP_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

GDLOAD_ID=$(qsub -q hoffmangroup -cwd -N gdload_K562 -hold_jid ${UMAP_ID} sub_gdload.sh)
GDLOAD_ID=$(echo ${GDLOAD_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

TRAIN_ID=$(qsub -q hoffmangroup -cwd -N K562_train -hold_jid GDLOAD_ID train.sh)
TRAIN_ID=$(echo ${TRAIN_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

ID_BASE_ID=$(qsub -q hoffmangroup -cwd -N K562_id_base -hold_jid ${TRAIN_ID} identify_base.sh)
ID_BASE_ID=$(echo ${ID_BASE_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

ID_BLANK_ID=$(qsub -q hoffmangroup -cwd -N K562_id_1blank -hold_jid ${TRAIN_ID} identify_1blank.sh)
ID_BLANK_ID=$(echo ${ID_BLANK_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')
