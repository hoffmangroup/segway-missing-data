#!/bin/bash
#$ -t 1-23

EXCLUDE_PATH="../../Data/exclude_coords.bed"
DATA_DIR="../../Data/K562"
GD_PREFIX="K562"
GD_SUFFIX="genomedata"
TRAIN_DIR="train_results"
ID_DIR_PREFIX="identify_results"
MARKS=(DNaseIStam Srf Nrsf Gabp H3k4me3 H3k27me3 H3k27ac H3k36me3 H4k20me1 \
       H3k9me1 H3k4me2 H3k4me1 H3k9ac Pol2b Ctcf Xrcc4 Nfe2 Jund Cmyc Max \
        Cfos Cjun Rad21)
IDX=$((${SGE_TASK_ID}-1))
ID_DIR="${ID_DIR_PREFIX}_${MARKS[${IDX}]}"
MARKS[${IDX}]="blank"

CMD_TRACKLIST=""

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    MARK=${MARKS[$i]}
    CMD_TRACKLIST="${CMD_TRACKLIST} ${DATA_DIR}/${GD_PREFIX}_${MARK}.${GD_SUFFIX}"
done

segway \
 --resolution=10 \
 --num-instances=10 \
 --minibatch-fraction=0.01 \
 --num-labels=10 \
 --max-train-rounds=10 \
 --exclude-coords="${EXCLUDE_PATH}" \
 identify \
 ${CMD_TRACKLIST} \
 train_results \
 ${ID_DIR}
