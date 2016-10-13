#!/bin/bash
#$ -t 1-23

UM_PREFIX="um"
UM_SUFFIX="bedGraph"
GD_PREFIX="K562"
GD_SUFFIX="genomedata"
MARKS=(DNaseIStam Srf Nrsf Gabp H3k4me3 H3k27me3 H3k27ac H3k36me3 H4k20me1 \
       H3k9me1 H3k4me2 H3k4me1 H3k9ac Pol2b Ctcf Xrcc4 Nfe2 Jund Cmyc Max \
        Cfos Cjun Rad21)
MARK=${MARKS[${SGE_TASK_ID}-1]}

genomedata-load \
 --sizes \
 --sequence ../GRCh38_EBV.chrom.sizes.tsv \
 --track ${MARK}="${UM_PREFIX}${MARK}.${UM_SUFFIX}" \
 "${GD_PREFIX}_${MARK}.${GD_SUFFIX}"

rm ${UM_PREFIX}${MARK}.${UM_SUFFIX}
