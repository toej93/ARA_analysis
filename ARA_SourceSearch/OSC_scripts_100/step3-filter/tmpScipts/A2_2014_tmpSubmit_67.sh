#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0510/run003553/event003553.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003551.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0510/run003554/event003554.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003551.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0510/run003555/event003555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003551.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0511/run003557/event003557.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003556.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0511/run003558/event003558.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003556.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0511/run003559/event003559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003556.dat &
wait
