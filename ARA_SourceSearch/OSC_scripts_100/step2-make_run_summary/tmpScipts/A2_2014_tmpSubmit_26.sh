#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0302/run003128/event003128.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0302/run003129/event003129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0302/run003130/event003130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0302/run003131/event003131.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0303/run003133/event003133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003132.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0303/run003134/event003134.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003132.dat &
wait
