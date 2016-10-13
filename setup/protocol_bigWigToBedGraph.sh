# Step 4 of Protocol Procedure

#!/bin/bash
MARKS=(H3K4me1 H3K4me3 H3K27ac H3K27me3 CTCF)
ACCESSIONS=(ENCFF496BAC ENCFF151DIJ ENCFF640LYS ENCFF615KRJ ENCFF616PVD)
BW_SUFFIX="bigWig"
BG_SUFFIX="bedGraph"
CELL="DOHH2"

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    ACCESSION=${ACCESSIONS[$i]}
    MARK=${MARKS[$i]}
    INFILE="${ACCESSION}_${CELL}_${MARK}.${BW_SUFFIX}"
    OUTFILE="${ACCESSION}_${CELL}_${MARK}.${BG_SUFFIX}"
    
    echo "Converting ${INFILE}"
    bigWigToBedGraph INFILE OUTFILE
    echo "Removing ${INFILE}"
    rm ${INFILE}
done
