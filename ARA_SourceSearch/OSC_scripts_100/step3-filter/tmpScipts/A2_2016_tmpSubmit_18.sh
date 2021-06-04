#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0128/run006784/event006784.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006782.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0129/run006785/event006785.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006782.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0129/run006786/event006786.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006782.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0129/run006788/event006788.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0129/run006789/event006789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0130/run006790/event006790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006787.dat &
wait
