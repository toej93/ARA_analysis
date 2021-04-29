#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0920/run006211/event006211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0920/run006212/event006212.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0920/run006213/event006213.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0920/run006215/event006215.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006214.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0921/run006216/event006216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006214.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0921/run006217/event006217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006214.dat &
wait
