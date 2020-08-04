#/bin/bash
#PBS -l nodes=1:ppn=3
#PBS -j oe
#PBS -A PCON0003
#PBS -m e
#PBS -l walltime=17:20:00

source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs
module load python/3.6-conda5.2
export HDF5_USE_FILE_LOCKING=FALSE

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/CenA_sourceSearch/Stokes

python deDisperse.py
