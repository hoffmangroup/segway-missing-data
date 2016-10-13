# Step 6 of Protocol Procedure


#!/bin/bash

BG_SUFFIX="bedGraph"
CELL="DOHH2"
GD_SUFFIX="genomedata"
MARKS=(CTCF H3K27ac H3K27me3 H3K4me1 H3K4me3)
ACCESSIONS=(ENCFF496BAC ENCFF151DIJ ENCFF640LYS ENCFF615KRJ ENCFF616PVD)

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    MARK=${MARKS[$i]}
    ACCESSION=${ACCESSIONS[$i]}
    INFILE="${ACCESSION}_${CELL}_${MARK}_umap.${BG_SUFFIX}"
    OUTFILE="${CELL}_${MARK}.${GD_SUFFIX}"

    echo "Loading ${INFILE}"
    genomedata-load \
    --sizes \
    --sequence ../GRCh38_EBV.chrom.sizes.tsv \
    --track ${MARK}=${INFILE} \
    ${OUTFILE}

    echo "Removing ${INFILE}"
    rm ${INFILE}
done