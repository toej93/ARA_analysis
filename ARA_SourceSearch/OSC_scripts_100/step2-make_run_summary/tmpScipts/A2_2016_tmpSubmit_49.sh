#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0417/run007124/event007124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0417/run007125/event007125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0418/run007126/event007126.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0418/run007127/event007127.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0418/run007128/event007128.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0418/run007129/event007129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
wait
