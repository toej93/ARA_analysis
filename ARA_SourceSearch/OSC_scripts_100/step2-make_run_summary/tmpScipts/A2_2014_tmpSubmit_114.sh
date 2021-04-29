#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0718/run003929/event003929.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0719/run003930/event003930.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0719/run003931/event003931.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0719/run003932/event003932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003928.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0719/run003934/event003934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003933.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0720/run003935/event003935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003933.dat &
wait
