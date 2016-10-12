#!/bin/bash
#$ -t 1-23

MARKS=(DNaseIStam Srf Nrsf Gabp H3k4me3 H3k27me3 H3k27ac H3k36me3 H4k20me1 \
       H3k9me1 H3k4me2 H3k4me1 H3k9ac Pol2b Ctcf Xrcc4 Nfe2 Jund Cmyc Max \
        Cfos Cjun Rad21)
IDX=$((${SGE_TASK_ID}-1))
MARK=${MARKS[${IDX}]}
BED_PREFIX="bed"
BED_SUFFIX="bed"
COV_PREFIX="coverage"

module load bedtools/2.23.0

for (( i=0; i<10; i++ ));
do
    bedtools coverage \
     -a ${BED_PREFIX}_base_$i.${BED_SUFFIX} \
     -b ${BED_PREFIX}_${MARK}_$i.${BED_SUFFIX} \
     > ${COV_PREFIX}_${MARK}_$i.${BED_SUFFIX}
done
