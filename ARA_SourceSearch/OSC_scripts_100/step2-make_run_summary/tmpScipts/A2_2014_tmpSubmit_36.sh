#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0316/run003252/event003252.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0317/run003253/event003253.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0317/run003254/event003254.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0317/run003256/event003256.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003255.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0317/run003257/event003257.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003255.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0318/run003258/event003258.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003255.dat &
wait
