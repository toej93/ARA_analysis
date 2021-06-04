#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0629/run003831/event003831.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0629/run003833/event003833.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0629/run003834/event003834.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0629/run003835/event003835.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0630/run003836/event003836.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0630/run003838/event003838.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003837.dat &
wait
