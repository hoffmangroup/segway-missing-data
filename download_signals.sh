URL="https://www.encodeproject.org"
MARKS=(H3K4me1 H3K4me3 H3K27ac H3K27me3 CTCF)
ACCESSIONS=(ENCFF496BAC ENCFF151DIJ ENCFF640LYS ENCFF615KRJ ENCFF616PVD)
FORMAT="bigWig"
CELL="MM.1S"

for (( i=0; i<${#MARKS[@]}; i++ ));
do
    ACCESSION=${ACCESSIONS[$i]}
    MARK=${MARKS[$i]}
    wget $URL/files/$ACCESSION/@@download/$ACCESSION.$FORMAT -O $ACCESSION\_$CELL\_$MARK.$FORMAT
done
