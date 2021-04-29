#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0921/run007966/event007966.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007964.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0922/run007967/event007967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007964.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0922/run007968/event007968.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007964.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0922/run007970/event007970.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007969.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0922/run007971/event007971.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007969.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0923/run007972/event007972.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007969.dat &
wait
