#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0603/run005669/event005669.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005668.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0603/run005670/event005670.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005668.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0603/run005671/event005671.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005668.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0603/run005672/event005672.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005668.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0604/run005674/event005674.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005673.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0604/run005675/event005675.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005673.dat &
wait
