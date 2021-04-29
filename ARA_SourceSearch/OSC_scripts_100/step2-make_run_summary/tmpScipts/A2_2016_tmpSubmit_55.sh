#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0427/run007169/event007169.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0427/run007170/event007170.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0427/run007171/event007171.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0427/run007172/event007172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0427/run007173/event007173.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0428/run007174/event007174.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007168.dat &
wait
