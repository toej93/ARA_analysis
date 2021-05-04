#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0809/run007776/event007776.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0809/run007777/event007777.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0810/run007780/event007780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0810/run007781/event007781.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0810/run007782/event007782.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0810/run007783/event007783.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007775.dat &
wait