#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0407/run003384/event003384.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003381.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0407/run003385/event003385.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003381.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0407/run003387/event003387.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003386.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0407/run003388/event003388.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003386.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0408/run003389/event003389.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003386.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0408/run003390/event003390.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003386.dat &
wait
