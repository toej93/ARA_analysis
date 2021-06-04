#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0401/run003354/event003354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0401/run003355/event003355.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0401/run003357/event003357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0401/run003358/event003358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0402/run003359/event003359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0402/run003360/event003360.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003356.dat &
wait
