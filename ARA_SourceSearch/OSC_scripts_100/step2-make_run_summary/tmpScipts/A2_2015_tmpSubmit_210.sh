#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1204/run006511/event006511.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1205/run006514/event006514.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1205/run006515/event006515.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1205/run006516/event006516.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1205/run006517/event006517.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1206/run006519/event006519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006518.dat &
wait
