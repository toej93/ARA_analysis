#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0708/run003876/event003876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003873.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0708/run003877/event003877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003873.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0708/run003879/event003879.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003878.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0709/run003880/event003880.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003878.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0709/run003881/event003881.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003878.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0709/run003882/event003882.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003878.dat &
wait
