#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0307/run003206/event003206.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0307/run003207/event003207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0308/run003208/event003208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0308/run003209/event003209.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0308/run003211/event003211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003210.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0308/run003212/event003212.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003210.dat &
wait
