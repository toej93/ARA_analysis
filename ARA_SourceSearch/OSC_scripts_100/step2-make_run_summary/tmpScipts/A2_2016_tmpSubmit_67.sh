#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0514/run007259/event007259.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007255.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0515/run007261/event007261.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0515/run007262/event007262.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0515/run007263/event007263.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0515/run007264/event007264.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007260.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0516/run007266/event007266.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007265.dat &
wait
