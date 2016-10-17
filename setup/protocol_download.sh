# Step 3 of Protocol Procedure

#!/bin/bash
URL="https://www.encodeproject.org"
MARKS=(H3K4me1 H3K4me3 H3K27ac H3K27me3 CTCF)
ACCESSIONS=(ENCFF509XSM ENCFF745GML ENCFF890NAY ENCFF592CSV ENCFF884IIL)
BW_SUFFIX="bigWig"
CELL="DOHH2"

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    ACCESSION=${ACCESSIONS[$i]}
    MARK=${MARKS[$i]}
    wget ${URL}/files/${ACCESSION}/@@download/${ACCESSION}.${BW_SUFFIX} -O ${ACCESSION}_${CELL}_${MARK}.${BW_SUFFIX}
done
