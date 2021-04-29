#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0914/run007928/event007928.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007924.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0914/run007930/event007930.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0914/run007931/event007931.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0915/run007932/event007932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0915/run007934/event007934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0915/run007935/event007935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007929.dat &
wait
