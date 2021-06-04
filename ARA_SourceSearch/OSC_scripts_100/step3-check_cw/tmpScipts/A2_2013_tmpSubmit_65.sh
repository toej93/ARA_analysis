#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1977/event1977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001956/pedestalValues.run001956.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1978/event1978.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001956/pedestalValues.run001956.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1979/event1979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001956/pedestalValues.run001956.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1980/event1980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001956/pedestalValues.run001956.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1982/event1982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001956/pedestalValues.run001956.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1983/event1983.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001956/pedestalValues.run001956.dat &
wait
date 
