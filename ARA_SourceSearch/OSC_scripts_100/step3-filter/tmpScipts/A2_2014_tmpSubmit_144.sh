#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0904/run004178/event004178.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0905/run004179/event004179.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0905/run004181/event004181.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0906/run004184/event004184.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0906/run004187/event004187.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0906/run004188/event004188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
wait
