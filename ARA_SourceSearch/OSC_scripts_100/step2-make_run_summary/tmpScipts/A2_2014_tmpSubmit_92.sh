#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0615/run003764/event003764.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003760.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0615/run003766/event003766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0616/run003767/event003767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0616/run003768/event003768.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0616/run003769/event003769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0616/run003770/event003770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
wait
