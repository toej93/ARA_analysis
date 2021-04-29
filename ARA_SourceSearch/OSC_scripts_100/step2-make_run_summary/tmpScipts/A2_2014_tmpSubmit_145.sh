#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0907/run004189/event004189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0907/run004191/event004191.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0907/run004192/event004192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0908/run004196/event004196.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004195.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0908/run004198/event004198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004195.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0909/run004199/event004199.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004195.dat &
wait
