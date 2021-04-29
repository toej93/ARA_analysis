#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0811/run004055/event004055.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0811/run004056/event004056.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0811/run004057/event004057.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0812/run004058/event004058.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0812/run004060/event004060.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004059.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0812/run004061/event004061.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004059.dat &
wait
