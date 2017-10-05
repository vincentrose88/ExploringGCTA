#!/bin/bash

maf=$2
plinkstem=$1
mkdir -p SNPFAM.$maf GCTA.$maf

#GRM first
gcta64 --make-grm-bin --bfile $plinkstem --maf $maf --out DKsib.MAF.${maf}
#SNPFAM then
gcta64 --make-bK 0.05 --grm DKsib.MAF.${maf} --out DKsib.MAF.${maf}.bK0.05
#Remember to create the mgrm file
touch mgrm.MAF.${maf}
echo "DKsib.MAF.${maf}" > mgrm.MAF.${maf}
echo "DKsib.MAF.${maf}.bK0.05" >> mgrm.MAF.${maf}
