#!/bin/bash
#
genomedata-load --sizes --sequence ../data/GRCh38_EBV.chrom.sizes.tsv --track CTCF=../data/bedGraph_blank/ENCFF616PVD_MM.1S_CTCF_blank.bedGraph MM.1S_CTCF_blank.genomedata
genomedata-load --sizes --sequence ../data/GRCh38_EBV.chrom.sizes.tsv --track H3K27ac=../data/bedGraph_blank/ENCFF640LYS_MM.1S_H3K27ac_blank.bedGraph MM.1S_H3K27ac_blank.genomedata
genomedata-load --sizes --sequence ../data/GRCh38_EBV.chrom.sizes.tsv --track H3K27me3=../data/bedGraph_blank/ENCFF615KRJ_MM.1S_H3K27me3_blank.bedGraph MM.1S_H3K27me3_blank.genomedata
genomedata-load --sizes --sequence ../data/GRCh38_EBV.chrom.sizes.tsv --track H3K4me1=../data/bedGraph_blank/ENCFF496BAC_MM.1S_H3K4me1_blank.bedGraph MM.1S_H3K4me1_blank.genomedata
genomedata-load --sizes --sequence ../data/GRCh38_EBV.chrom.sizes.tsv --track H3K4me3=../data/bedGraph_blank/ENCFF151DIJ_MM.1S_H3K4me3_blank.bedGraph MM.1S_H3K4me3_blank.genomedata
