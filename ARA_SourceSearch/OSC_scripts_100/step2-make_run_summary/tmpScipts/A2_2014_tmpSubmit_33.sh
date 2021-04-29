#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0311/run003228/event003228.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003225.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0312/run003229/event003229.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003225.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0312/run003231/event003231.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003230.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0312/run003232/event003232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003230.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0312/run003233/event003233.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003230.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0313/run003234/event003234.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003230.dat &
wait
