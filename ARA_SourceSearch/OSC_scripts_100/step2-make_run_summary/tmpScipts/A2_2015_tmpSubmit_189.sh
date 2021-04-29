#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1015/run006338/event006338.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006334.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1015/run006340/event006340.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006339.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1016/run006341/event006341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006339.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1016/run006342/event006342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006339.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1016/run006343/event006343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006339.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1016/run006345/event006345.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006344.dat &
wait
