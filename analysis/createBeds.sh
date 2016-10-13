#!/bin/bash


MARKS=(DNaseIStam Srf Nrsf Gabp H3k4me3 H3k27me3 H3k27ac H3k36me3 H4k20me1 \
       H3k9me1 H3k4me2 H3k4me1 H3k9ac Pol2b Ctcf Xrcc4 Nfe2 Jund Cmyc Max \
        Cfos Cjun Rad21 base)
IDX=$((${SGE_TASK_ID}-1))
MARK=${MARKS[${IDX}]}
SEGWAY_NAME="segway.bed.gz"
BED_PREFIX="bed"
BED_SUFFIX="bed"

DIR_PREFIX="identify_results_${MARK}" # doing it this way instead of a for loop because there are too many string literal problems when working with awk and single quotes
echo "Reading ${MARK}"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==0 {print $0}' > ${BED_PREFIX}_${MARK}_0.${BED_SUFFIX}
echo "  C    0"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==1 {print $0}' > ${BED_PREFIX}_${MARK}_1.${BED_SUFFIX}
echo "  C    1"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==2 {print $0}' > ${BED_PREFIX}_${MARK}_2.${BED_SUFFIX}
echo "  C    2"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==3 {print $0}' > ${BED_PREFIX}_${MARK}_3.${BED_SUFFIX}
echo "  C    3"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==4 {print $0}' > ${BED_PREFIX}_${MARK}_4.${BED_SUFFIX}
echo "  C    4"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==5 {print $0}' > ${BED_PREFIX}_${MARK}_5.${BED_SUFFIX}
echo "  C    5"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==6 {print $0}' > ${BED_PREFIX}_${MARK}_6.${BED_SUFFIX}
echo "  C    6"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==7 {print $0}' > ${BED_PREFIX}_${MARK}_7.${BED_SUFFIX}
echo "  C    7"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==8 {print $0}' > ${BED_PREFIX}_${MARK}_8.${BED_SUFFIX}
echo "  C    8"
zcat ${DIR_PREFIX}/${SEGWAY_NAME} | sed "1d" | awk '$4==9 {print $0}' > ${BED_PREFIX}_${MARK}_9.${BED_SUFFIX}
echo "  C    9"
