#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0315/run003244/event003244.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003240.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0315/run003246/event003246.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0315/run003247/event003247.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0316/run003248/event003248.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0316/run003249/event003249.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0316/run003251/event003251.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
wait
