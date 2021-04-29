#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0224/run006923/event006923.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006919.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0224/run006925/event006925.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006924.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0224/run006926/event006926.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006924.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0225/run006927/event006927.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006924.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0225/run006928/event006928.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006924.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0225/run006931/event006931.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006929.dat &
wait
