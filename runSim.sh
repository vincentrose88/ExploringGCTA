#/bin/bash
plinkstem=$1
sim=$2
#Extract 1K random SNPs
plink19 --allow-no-sex --bfile $plinkstem --thin-count 1000 --out plink/1K.sim.$sim.SNPs --make-bed

#Add betas and extract 95% tails
Rscript addBetas.R plink/1K.sim.$sim.SNPs.bim trunc.sim/sim.$sim.truncSNPs

#Simulate phenotypes for each h
for h in 0.4 0.6 0.8
do
    gcta64 --bfile $plinkstem --simu-qt --simu-causal-loci trunc.sim/sim.$sim.truncSNPs.withBetas --simu-hsq $h --out trunc.sim/sim.$sim.h.$h.gctaSim
done


#All genosums and phenos are now created for each h - time to collect and plot  
