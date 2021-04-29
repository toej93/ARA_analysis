#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0511/run007244/event007244.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0512/run007246/event007246.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0512/run007247/event007247.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0512/run007248/event007248.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0512/run007249/event007249.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0513/run007251/event007251.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007250.dat &
wait
