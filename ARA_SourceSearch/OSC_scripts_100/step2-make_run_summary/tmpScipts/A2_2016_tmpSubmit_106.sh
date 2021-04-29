#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0713/run007582/event007582.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007581.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0713/run007583/event007583.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007581.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0714/run007584/event007584.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007581.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0714/run007585/event007585.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007581.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0714/run007587/event007587.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0714/run007588/event007588.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007586.dat &
wait
