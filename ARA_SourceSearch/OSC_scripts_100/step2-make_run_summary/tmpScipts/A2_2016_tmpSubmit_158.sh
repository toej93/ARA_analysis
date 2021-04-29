#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1010/run008064/event008064.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1010/run008065/event008065.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1010/run008066/event008066.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1011/run008067/event008067.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1011/run008069/event008069.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008068.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1011/run008070/event008070.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008068.dat &
wait
