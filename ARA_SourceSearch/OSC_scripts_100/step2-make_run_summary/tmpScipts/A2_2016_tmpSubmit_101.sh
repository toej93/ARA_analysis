#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0706/run007544/event007544.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007541.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0706/run007545/event007545.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007541.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0706/run007547/event007547.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0706/run007548/event007548.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0707/run007549/event007549.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0707/run007550/event007550.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007546.dat &
wait
