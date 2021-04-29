#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1014/run006331/event006331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1014/run006332/event006332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1014/run006333/event006333.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006329.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1015/run006335/event006335.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006334.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1015/run006336/event006336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006334.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1015/run006337/event006337.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006334.dat &
wait
