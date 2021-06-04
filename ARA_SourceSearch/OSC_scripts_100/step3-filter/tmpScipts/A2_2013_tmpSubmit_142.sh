#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2666/event2666.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002665/pedestalValues.run002665.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2667/event2667.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002665/pedestalValues.run002665.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2668/event2668.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002665/pedestalValues.run002665.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2669/event2669.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002665/pedestalValues.run002665.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2671/event2671.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2672/event2672.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002670/pedestalValues.run002670.dat &
wait
