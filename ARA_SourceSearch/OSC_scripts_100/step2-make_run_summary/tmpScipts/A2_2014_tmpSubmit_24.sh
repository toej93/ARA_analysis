#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0227/run003111/event003111.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003107.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0227/run003113/event003113.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003112.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0227/run003114/event003114.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003112.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0227/run003115/event003115.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003112.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0228/run003116/event003116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003112.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0228/run003118/event003118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
wait
