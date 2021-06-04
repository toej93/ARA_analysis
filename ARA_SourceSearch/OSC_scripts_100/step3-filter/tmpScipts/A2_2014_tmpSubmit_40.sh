#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0322/run003282/event003282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0323/run003283/event003283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0323/run003284/event003284.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003280.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0323/run003286/event003286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0323/run003287/event003287.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0324/run003288/event003288.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
wait
