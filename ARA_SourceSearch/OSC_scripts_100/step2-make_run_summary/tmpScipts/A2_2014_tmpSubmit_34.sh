#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0313/run003236/event003236.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003235.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0313/run003237/event003237.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003235.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0313/run003238/event003238.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003235.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0314/run003239/event003239.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003235.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0314/run003241/event003241.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003240.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0315/run003243/event003243.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003240.dat &
wait
