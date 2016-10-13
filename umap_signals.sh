#!/bin/bash
#
module list
module load bedtools/2.23.0
module list

MARKS=(H3K4me1 H3K4me3 H3K27ac H3K27me3 CTCF)
ACCESSIONS=(ENCFF496BAC ENCFF151DIJ ENCFF640LYS ENCFF615KRJ ENCFF616PVD)
FORMAT="bedGraph"
CELL="MM.1S"

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    ACCESSION=${ACCESSIONS[$i]}
    MARK=${MARKS[$i]}
    bedtools intersect -a $ACCESSION\_$CELL\_$MARK.$FORMAT -b k36.Umap.MultiTrackMappability.filtered.bed > $ACCESSION\_$CELL\_$MARK\_from_umap_regions.$FORMAT
done
