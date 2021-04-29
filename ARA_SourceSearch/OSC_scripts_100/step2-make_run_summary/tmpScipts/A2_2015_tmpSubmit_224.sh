#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1226/run006620/event006620.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1226/run006622/event006622.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1226/run006623/event006623.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1227/run006624/event006624.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1227/run006625/event006625.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1227/run006627/event006627.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006626.dat &
wait
