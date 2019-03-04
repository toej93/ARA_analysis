#/bin/bash
#PBS -N Merge_Rayleigh
#PBS -l nodes=1:ppn=3
#PBS -j oe
#PBS -o logs_pbs/Merge.out
#PBS -A PCON0003
#PBS -l mem=16000MB
#PBS -m ea
#PBS -l walltime=03:00:00

source /users/PCON0003/cond0068/.bash_profile_pitzer

cd /users/PCON0003/cond0068/ARA/AraRoot/analysis/files_distributions

hadd merged_rayleigh.root Rayleigh_spectral_dist_*
