#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2151/event2151.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2153/event2153.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2154/event2154.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2155/event2155.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2156/event2156.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2158/event2158.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
wait
