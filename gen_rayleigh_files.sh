#/bin/bash
#PBS -N RayleighA2_fits
#PBS -l nodes=1:ppn=20
#PBS -j oe
#PBS -o logs_pbs/ArrayRayleigh_A2_fits.out
#PBS -A PCON0003
#PBS -l mem=64000MB
#PBS -m ea
#PBS -l walltime=00:30:00

cd /users/PCON0003/cond0068/ARA/AraRoot/analysis
source /users/PCON0003/cond0068/.bash_profile_pitzer_root6

for i in {0..15}
do
    root -l -q -b "fit_distributions.C($i)" &
done
wait
