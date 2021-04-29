#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0530/run007334/event007334.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0530/run007336/event007336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0530/run007337/event007337.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0530/run007338/event007338.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0531/run007339/event007339.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007335.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0531/run007341/event007341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007340.dat &
wait
