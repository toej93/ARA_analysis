#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1669/event1669.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001666/pedestalValues.run001666.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1670/event1670.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001666/pedestalValues.run001666.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1672/event1672.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001671/pedestalValues.run001671.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1673/event1673.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001671/pedestalValues.run001671.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1674/event1674.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001671/pedestalValues.run001671.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1675/event1675.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001671/pedestalValues.run001671.dat &
wait
