#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0215/run003050/event003050.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0215/run003051/event003051.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0215/run003053/event003053.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0216/run003059/event003059.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0217/run003060/event003060.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0217/run003061/event003061.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
wait
