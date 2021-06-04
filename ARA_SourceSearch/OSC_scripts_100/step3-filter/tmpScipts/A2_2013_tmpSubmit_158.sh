#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2787/event2787.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2789/event2789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2790/event2790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2791/event2791.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2792/event2792.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
wait
