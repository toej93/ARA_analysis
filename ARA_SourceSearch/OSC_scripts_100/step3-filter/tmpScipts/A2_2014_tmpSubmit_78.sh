#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0527/run003660/event003660.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003656.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0527/run003662/event003662.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003661.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0527/run003663/event003663.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003661.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0528/run003664/event003664.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003661.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0528/run003665/event003665.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003661.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0528/run003667/event003667.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003666.dat &
wait
