#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2764/event2764.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2765/event2765.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2768/event2768.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2769/event2769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2770/event2770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2771/event2771.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
wait
