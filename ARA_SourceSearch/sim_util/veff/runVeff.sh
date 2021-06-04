#!/bin/bash

#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --account=PAS0654
#SBATCH --mail-type=FAIL
#SBATCH --time=01:30:00
eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/AraSim

FILES=${SIMDIR}/*.root

./veff_aeff2_sourceSearch ${POSNURAD} ${DEPTH} source_Search ${FILES} 
