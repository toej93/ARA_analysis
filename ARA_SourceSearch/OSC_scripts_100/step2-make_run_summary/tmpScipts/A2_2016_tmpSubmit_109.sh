#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0718/run007608/event007608.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0718/run007609/event007609.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0718/run007610/event007610.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007601.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0719/run007368/event007368.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0719/run007402/event007402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0719/run007612/event007612.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
wait
