#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0104/run004779/event004779.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004776.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0104/run004780/event004780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004776.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0104/run004782/event004782.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004781.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0104/run004783/event004783.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004781.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0105/run004784/event004784.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004781.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0105/run004788/event004788.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
wait
