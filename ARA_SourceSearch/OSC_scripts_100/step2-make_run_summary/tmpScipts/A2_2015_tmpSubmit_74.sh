#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0423/run005466/event005466.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005463.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0424/run005467/event005467.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005463.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0424/run005469/event005469.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005468.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0424/run005470/event005470.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005468.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0424/run005471/event005471.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005468.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0425/run005472/event005472.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005468.dat &
wait
