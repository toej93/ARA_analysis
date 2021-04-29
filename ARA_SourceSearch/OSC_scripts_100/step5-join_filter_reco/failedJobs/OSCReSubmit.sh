#!/bin/bash

#SBATCH --nodes=1 --ntasks-per-node=2
#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 6 ${FILTERDIR} ${OUTDIR} ${DATA} &
./v2_analysis_reco ${ISSIM} ${STATION} ${YEAR} 19 ${FILTERDIR} ${OUTDIR} ${DATA} &
wait
