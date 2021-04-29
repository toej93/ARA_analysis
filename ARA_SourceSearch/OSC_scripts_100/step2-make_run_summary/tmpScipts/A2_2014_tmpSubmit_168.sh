#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1023/run004417/event004417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004415.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1023/run004418/event004418.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004415.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1023/run004419/event004419.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004415.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1023/run004421/event004421.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1024/run004422/event004422.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1024/run004423/event004423.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004420.dat &
wait
