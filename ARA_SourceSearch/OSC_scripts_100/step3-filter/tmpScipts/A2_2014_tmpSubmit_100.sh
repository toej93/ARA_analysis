#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0627/run003824/event003824.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0627/run003825/event003825.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0628/run003826/event003826.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0628/run003828/event003828.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0628/run003829/event003829.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0628/run003830/event003830.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
wait
