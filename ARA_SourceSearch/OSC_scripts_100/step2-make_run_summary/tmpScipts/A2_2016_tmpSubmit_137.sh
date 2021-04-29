#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0908/run007898/event007898.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007887.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0908/run007899/event007899.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007887.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0908/run007900/event007900.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007887.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0909/run007901/event007901.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007887.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0909/run007902/event007902.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007887.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0909/run007904/event007904.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007903.dat &
wait
