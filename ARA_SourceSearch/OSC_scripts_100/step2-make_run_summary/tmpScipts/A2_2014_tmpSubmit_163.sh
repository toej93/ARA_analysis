#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1015/run004379/event004379.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004375.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1015/run004381/event004381.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1015/run004382/event004382.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1016/run004383/event004383.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1016/run004384/event004384.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1016/run004386/event004386.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004385.dat &
wait
