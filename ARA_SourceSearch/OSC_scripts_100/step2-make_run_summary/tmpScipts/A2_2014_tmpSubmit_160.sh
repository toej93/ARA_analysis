#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1010/run004357/event004357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1011/run004358/event004358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1011/run004359/event004359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1011/run004361/event004361.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1011/run004362/event004362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1012/run004363/event004363.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
wait
