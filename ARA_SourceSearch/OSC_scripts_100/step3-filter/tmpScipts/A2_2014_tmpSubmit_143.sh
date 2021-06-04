#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0902/run004164/event004164.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0902/run004166/event004166.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0902/run004167/event004167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0903/run004172/event004172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0903/run004173/event004173.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0904/run004176/event004176.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
wait
