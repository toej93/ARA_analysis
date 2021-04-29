#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0218/run006894/event006894.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0218/run006895/event006895.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0219/run006897/event006897.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0219/run006898/event006898.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0219/run006899/event006899.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0219/run006900/event006900.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
wait
