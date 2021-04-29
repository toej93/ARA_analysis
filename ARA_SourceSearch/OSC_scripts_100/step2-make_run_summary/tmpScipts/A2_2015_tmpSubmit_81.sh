#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0504/run005519/event005519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0504/run005520/event005520.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0504/run005521/event005521.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0505/run005522/event005522.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0505/run005524/event005524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005523.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0505/run005525/event005525.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005523.dat &
wait
