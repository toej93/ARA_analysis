#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0630/run007517/event007517.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007516.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0630/run007518/event007518.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007516.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0630/run007519/event007519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007516.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0630/run007520/event007520.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007516.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0701/run007522/event007522.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0701/run007523/event007523.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
wait
