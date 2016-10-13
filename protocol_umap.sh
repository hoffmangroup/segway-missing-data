# Step 5 of Protocol Procedure
# This can be run after k36.Umap.MultiTrackMappability.filtered.bed is made

#!/bin/bash
module load bedtools/2.23.0

MARKS=(H3K4me1 H3K4me3 H3K27ac H3K27me3 CTCF)
ACCESSIONS=(ENCFF496BAC ENCFF151DIJ ENCFF640LYS ENCFF615KRJ ENCFF616PVD)
BG_SUFFIX="bedGraph"
CELL="DOHH2"
K36_BED_PATH="k36.Umap.MultiTrackMappability.filtered.bed"

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    ACCESSION=${ACCESSIONS[$i]}
    MARK=${MARKS[$i]}
    INFILE="${ACCESSION}_${CELL}_${MARK}.${BG_SUFFIX}"
    OUTFILE="${ACCESSION}_${CELL}_${MARK}_umap.${BG_SUFFIX}"

    echo "Intersecting ${INFILE}"
    bedtools intersect -a ${INFILE} -b ${K36_BED_PATH} > ${OUTFILE}
    echo "Removing ${INFILE}"
    rm ${INFILE}
done
