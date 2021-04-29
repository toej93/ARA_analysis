#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0826/run006086/event006086.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006084.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0826/run006087/event006087.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006084.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0826/run006088/event006088.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006084.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0826/run006090/event006090.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006089.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0827/run006091/event006091.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006089.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0827/run006092/event006092.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006089.dat &
wait
