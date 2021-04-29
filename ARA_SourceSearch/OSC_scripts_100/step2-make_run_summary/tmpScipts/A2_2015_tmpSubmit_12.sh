#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0120/run004877/event004877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0120/run004878/event004878.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0121/run004937/event004937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0121/run004938/event004938.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0121/run004939/event004939.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0122/run004940/event004940.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
wait
