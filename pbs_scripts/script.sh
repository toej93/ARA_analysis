#/bin/bash
#PBS -N find3rdpeakvsquared
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -o logs_pbs/find3peakvsq.out
#PBS -A PCON0003
#PBS -t 2011-3000%40
#PBS -l mem=8000MB
#PBS -m n
#PBS -l walltime=00:10:00
source /users/PCON0003/cond0068/.bash_profile_pitzer
cd /users/PCON0003/cond0068/ARA/AraRoot/analysis


./find3rdVsquare 2 2013 ${PBS_ARRAYID}
    
    
