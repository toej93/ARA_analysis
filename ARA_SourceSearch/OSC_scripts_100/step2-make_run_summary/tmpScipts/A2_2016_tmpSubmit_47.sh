#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0414/run007110/event007110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0415/run007111/event007111.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0415/run007112/event007112.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0415/run007113/event007113.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0415/run007115/event007115.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0416/run007116/event007116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
wait
