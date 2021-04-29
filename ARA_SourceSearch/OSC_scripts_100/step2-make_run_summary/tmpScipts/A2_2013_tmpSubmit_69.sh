#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2007/event2007.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2008/event2008.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2009/event2009.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2010/event2010.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2012/event2012.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2013/event2013.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
wait
