#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0806/run007761/event007761.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0806/run007762/event007762.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0807/run007763/event007763.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0807/run007764/event007764.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007755.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0807/run007766/event007766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0807/run007767/event007767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007765.dat &
wait
