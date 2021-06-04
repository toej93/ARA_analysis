#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0422/run003459/event003459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0422/run003460/event003460.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0422/run003462/event003462.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0422/run003463/event003463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0501/run003505/event003505.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003500.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0501/run003507/event003507.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003506.dat &
wait
