#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1220/run006590/event006590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1220/run006591/event006591.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1220/run006593/event006593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1220/run006594/event006594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1221/run006595/event006595.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1221/run006596/event006596.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006592.dat &
wait
