#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0605/run007364/event007364.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007360.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0605/run007366/event007366.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0605/run007367/event007367.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0606/run007400/event007400.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0606/run007401/event007401.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0606/run007405/event007405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
wait
