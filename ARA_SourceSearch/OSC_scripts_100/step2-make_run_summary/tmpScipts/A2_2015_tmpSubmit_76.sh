#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0426/run005481/event005481.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005478.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0427/run005482/event005482.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005478.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0427/run005484/event005484.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005483.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0427/run005485/event005485.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005483.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0428/run005486/event005486.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005483.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0428/run005487/event005487.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005483.dat &
wait
