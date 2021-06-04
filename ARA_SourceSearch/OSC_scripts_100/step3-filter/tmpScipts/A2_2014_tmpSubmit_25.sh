#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0228/run003119/event003119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0301/run003121/event003121.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0301/run003123/event003123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0301/run003124/event003124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0301/run003125/event003125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0302/run003126/event003126.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
wait
