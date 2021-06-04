#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1018/run006353/event006353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006349.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1018/run006355/event006355.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1019/run006356/event006356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1019/run006357/event006357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1019/run006358/event006358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006354.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1019/run006360/event006360.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006359.dat &
wait
