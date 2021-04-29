#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0526/run007321/event007321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0527/run007322/event007322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0527/run007323/event007323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0527/run007324/event007324.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0527/run007325/event007325.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0528/run007327/event007327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
wait
