#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0901/run006116/event006116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006114.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0901/run006117/event006117.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006114.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0901/run006118/event006118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006114.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0901/run006120/event006120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006119.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0902/run006121/event006121.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006119.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0902/run006122/event006122.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006119.dat &
wait
