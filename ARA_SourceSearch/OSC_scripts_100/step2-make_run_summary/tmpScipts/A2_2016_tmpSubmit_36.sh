#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0225/run006932/event006932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0226/run006933/event006933.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0226/run006934/event006934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0226/run006935/event006935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006929.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0226/run006937/event006937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006936.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0227/run006938/event006938.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006936.dat &
wait
