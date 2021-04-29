#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0617/run007456/event007456.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007452.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0617/run007458/event007458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007457.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0618/run007459/event007459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007457.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0618/run007460/event007460.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007457.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0618/run007461/event007461.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007457.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0618/run007463/event007463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007462.dat &
wait
