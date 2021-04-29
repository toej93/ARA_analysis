#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1012/run006323/event006323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006319.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1013/run006325/event006325.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1013/run006326/event006326.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1013/run006327/event006327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1013/run006328/event006328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006324.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1014/run006330/event006330.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006329.dat &
wait
