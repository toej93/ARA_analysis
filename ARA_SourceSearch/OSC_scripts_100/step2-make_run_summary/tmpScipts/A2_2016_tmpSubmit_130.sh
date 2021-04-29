#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0828/run007834/event007834.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007832.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0828/run007835/event007835.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007832.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0828/run007836/event007836.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007832.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0828/run007838/event007838.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0829/run007839/event007839.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0829/run007840/event007840.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007837.dat &
wait
