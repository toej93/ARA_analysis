#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0630/run005804/event005804.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0630/run005805/event005805.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0630/run005806/event005806.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0630/run005807/event005807.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0701/run005809/event005809.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005808.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0701/run005810/event005810.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005808.dat &
wait
