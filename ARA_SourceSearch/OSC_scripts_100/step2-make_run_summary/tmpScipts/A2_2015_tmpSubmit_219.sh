#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1218/run006582/event006582.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1218/run006583/event006583.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1219/run006584/event006584.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1219/run006587/event006587.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1219/run006588/event006588.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1219/run006589/event006589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
wait
