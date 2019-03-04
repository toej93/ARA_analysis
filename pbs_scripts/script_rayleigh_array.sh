#/bin/bash
#PBS -N RayleighA2_array
#PBS -l nodes=1:ppn=1
#PBS -j oe
#PBS -o logs_pbs/ArrayRayleigh_A2.out
#PBS -A PCON0003
#PBS -t 2011-3000%40
#PBS -l mem=8000MB
#PBS -m n
#PBS -l walltime=00:30:00

source /users/PCON0003/cond0068/.bash_profile_pitzer


cd /users/PCON0003/cond0068/ARA/AraRoot/analysis

./make_fits_noise 2 2013 ${PBS_ARRAYID}
