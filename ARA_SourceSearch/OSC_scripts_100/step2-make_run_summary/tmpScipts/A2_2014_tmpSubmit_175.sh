#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1102/run004469/event004469.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1102/run004471/event004471.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004470.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1103/run004472/event004472.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004470.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1103/run004473/event004473.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004470.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1103/run004474/event004474.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004470.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1103/run004476/event004476.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004475.dat &
wait
