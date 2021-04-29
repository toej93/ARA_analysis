#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0618/run005744/event005744.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005743.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0618/run005745/event005745.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005743.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0618/run005746/event005746.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005743.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0618/run005747/event005747.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005743.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0619/run005749/event005749.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0619/run005750/event005750.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
wait
