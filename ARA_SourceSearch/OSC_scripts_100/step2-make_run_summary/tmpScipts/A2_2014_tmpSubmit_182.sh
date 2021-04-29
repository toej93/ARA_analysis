#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1113/run004522/event004522.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004520.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1113/run004523/event004523.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004520.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1113/run004524/event004524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004520.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1114/run004526/event004526.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004525.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1114/run004527/event004527.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004525.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1114/run004528/event004528.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004525.dat &
wait
