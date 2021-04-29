#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0811/run007789/event007789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0811/run007790/event007790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0811/run007791/event007791.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0812/run007792/event007792.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0812/run007793/event007793.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0812/run007795/event007795.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007794.dat &
wait
