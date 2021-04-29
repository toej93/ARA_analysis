#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0416/run007117/event007117.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0416/run007118/event007118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0416/run007119/event007119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0416/run007120/event007120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0417/run007121/event007121.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007114.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0417/run007123/event007123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
wait
