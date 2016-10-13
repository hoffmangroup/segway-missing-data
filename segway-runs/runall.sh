#!/bin/bash

# submit job and store output text
TRAIN_ID=$(qsub -q hoffmangroup -cwd -N K562_train -hold_jid GDLOAD_ID train.sh)
# parse text for job ID to be used for holding
TRAIN_ID=$(echo ${TRAIN_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

ID_BASE_ID=$(qsub -q hoffmangroup -cwd -N K562_id_base -hold_jid ${TRAIN_ID} identify_base.sh)
ID_BASE_ID=$(echo ${ID_BASE_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')

ID_BLANK_ID=$(qsub -q hoffmangroup -cwd -N K562_id_1blank -hold_jid ${TRAIN_ID} identify_1blank.sh)
ID_BLANK_ID=$(echo ${ID_BLANK_ID} | awk 'match($0,/[0-9]+/){print substr($0, RSTART, RLENGTH)}')
