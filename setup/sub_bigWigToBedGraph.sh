#!/bin/bash
#$ -t 1-23
FILES=("wgEncodeUwDnaseK562Aln_2Reps.norm5.rawsignal.bw" 
       "wgEncodeHaibTfbsK562SrfV0416101Aln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeHaibTfbsK562NrsfV0416102Aln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeHaibTfbsK562GabpV0416101Aln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k4me3StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k27me3StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k27acStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k36me3StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H4k20me1StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k9me1StdAln_1Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k4me2StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k4me1StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562H3k9acStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562Pol2bStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeBroadHistoneK562CtcfStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562Xrcc4StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562Nfe2StdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562JundStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562CmycStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562MaxStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562CfosStdAln_3Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562CjunStdAln_2Reps.norm5.rawsignal.bw" \
       "wgEncodeSydhTfbsK562Rad21StdAln_2Reps.norm5.rawsignal.bw") 
BW_DIR="/mnt/work1/data/commondata/ENCODE/data_ENCODE_ucsc/hg19_encodeAnalysisHub_build37/Metadata"

MARKS=(DNaseIStam Srf Nrsf Gabp H3k4me3 H3k27me3 H3k27ac H3k36me3 H4k20me1 \
       H3k9me1 H3k4me2 H3k4me1 H3k9ac Pol2b Ctcf Xrcc4 Nfe2 Jund Cmyc Max \
        Cfos Cjun Rad21)

IDX=$((${SGE_TASK_ID}-1))
MARK=${MARKS[${IDX}]}
FILE=${FILES[${IDX}]}
BG_PREFIX="bg"
BG_SUFFIX="bedGraph"
module load ucsctools/315
bigWigToBedGraph ${BW_DIR}/${FILE} ${BG_PREFIX}${MARK}.${BG_SUFFIX}
