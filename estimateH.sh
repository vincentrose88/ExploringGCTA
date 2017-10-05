#!/bin/bash

sim=$1
maf=$2
h=$3
#for h in 0.4 0.6 0.8
#do
#SNPFAM    
gcta64 --mgrm mgrm.MAF.${maf} --pheno trunc.sim/sim.$sim.h.$h.gctaSim.phen --reml --out SNPFAM.$maf/sim.$sim.h.$h.tmpOut
head -9 SNPFAM.$maf/sim.$sim.h.$h.tmpOut.hsq | tail -1 | cut -f2,3 > SNPFAM.$maf/sim.$sim.h.$h.final.out
#GCTA
gcta64 --grm DKsib.MAF.${maf} --pheno trunc.sim/sim.$sim.h.$h.gctaSim.phen --reml --out GCTA.$maf/sim.$sim.h.$h.tmpOut
head -5 GCTA.$maf/sim.$sim.h.$h.tmpOut.hsq | tail -1 | cut -f2,3 > GCTA.$maf/sim.$sim.h.$h.final.out
#done
