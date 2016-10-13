#!/bin/bash
#$ -t 1-23
BG_PREFIX="bg"
BG_SUFFIX="bedGraph"
UM_PREFIX="um"
MARKS=(DNaseIStam Srf Nrsf Gabp H3k4me3 H3k27me3 H3k27ac H3k36me3 H4k20me1 \
       H3k9me1 H3k4me2 H3k4me1 H3k9ac Pol2b Ctcf Xrcc4 Nfe2 Jund Cmyc Max \
        Cfos Cjun Rad21)
MULTITRACK_BED="../bedGraph/k36.Umap.MultiTrackMappability.filtered.bed"

IDX=$((${SGE_TASK_ID}-1))
MARK=${MARKS[${IDX}]}
module load bedtools/2.23.0
bedtools intersect -a ${BG_PREFIX}${MARK}.${BG_SUFFIX} -b ${MULTITRACK_BED} > ${UM_PREFIX}${MARK}.${BG_SUFFIX}
rm ${BG_PREFIX}${MARK}.${BG_SUFFIX}
