#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1005/run006286/event006286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006284.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1005/run006287/event006287.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006284.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1005/run006288/event006288.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006284.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1006/run006290/event006290.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006289.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1006/run006291/event006291.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006289.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1006/run006292/event006292.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006289.dat &
wait
