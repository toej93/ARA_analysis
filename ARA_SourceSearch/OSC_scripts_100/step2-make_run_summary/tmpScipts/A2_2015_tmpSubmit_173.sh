#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0921/run006218/event006218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006214.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0921/run006220/event006220.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006219.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0922/run006221/event006221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006219.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0922/run006222/event006222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006219.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0922/run006223/event006223.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006219.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0922/run006225/event006225.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006224.dat &
wait
