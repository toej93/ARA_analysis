#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1101/run004462/event004462.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1101/run004463/event004463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1101/run004464/event004464.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1101/run004466/event004466.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1102/run004467/event004467.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1102/run004468/event004468.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
wait
