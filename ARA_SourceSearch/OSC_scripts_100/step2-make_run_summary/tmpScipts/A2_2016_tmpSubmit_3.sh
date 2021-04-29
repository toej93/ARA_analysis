#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0105/run006672/event006672.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006671.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0106/run006673/event006673.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006671.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0106/run006674/event006674.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006671.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0106/run006675/event006675.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006671.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0106/run006677/event006677.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0107/run006678/event006678.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006676.dat &
wait
