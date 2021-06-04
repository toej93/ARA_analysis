#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1011/run008071/event008071.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008068.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1012/run008072/event008072.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008068.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1012/run008074/event008074.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008073.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1012/run008075/event008075.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008073.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1012/run008076/event008076.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008073.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1013/run008077/event008077.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008073.dat &
wait
