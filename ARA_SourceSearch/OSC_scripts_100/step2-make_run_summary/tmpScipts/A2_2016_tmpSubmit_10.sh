#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0116/run006724/event006724.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0117/run006726/event006726.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0117/run006727/event006727.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0117/run006728/event006728.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0117/run006729/event006729.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0118/run006730/event006730.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006692.dat &
wait
