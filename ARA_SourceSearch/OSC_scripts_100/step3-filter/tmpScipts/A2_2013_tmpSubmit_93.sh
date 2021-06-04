#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2220/event2220.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2221/event2221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2226/event2226.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2227/event2227.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2228/event2228.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2229/event2229.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
wait
