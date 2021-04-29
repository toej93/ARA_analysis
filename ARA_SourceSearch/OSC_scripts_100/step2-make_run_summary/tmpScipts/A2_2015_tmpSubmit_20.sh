#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0202/run004994/event004994.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0202/run004995/event004995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004991.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0202/run004997/event004997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0202/run004998/event004998.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0203/run004999/event004999.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0203/run005000/event005000.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004996.dat &
wait
