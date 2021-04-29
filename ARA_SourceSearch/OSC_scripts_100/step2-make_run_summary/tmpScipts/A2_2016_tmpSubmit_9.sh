#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0115/run006718/event006718.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0115/run006719/event006719.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0115/run006720/event006720.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0115/run006721/event006721.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0115/run006722/event006722.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0116/run006723/event006723.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
wait
