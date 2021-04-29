#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0209/run003024/event003024.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003021.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0209/run003025/event003025.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003021.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0210/run003027/event003027.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003026.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0211/run003032/event003032.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0211/run003033/event003033.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0211/run003035/event003035.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
wait
