#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2204/event2204.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2205/event2205.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2207/event2207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2208/event2208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2209/event2209.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2216/event2216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
wait
