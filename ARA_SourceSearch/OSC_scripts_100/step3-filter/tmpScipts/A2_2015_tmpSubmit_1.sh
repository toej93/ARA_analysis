#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0102/run004772/event004772.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0102/run004773/event004773.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0103/run004774/event004774.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0103/run004775/event004775.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0103/run004777/event004777.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004776.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0103/run004778/event004778.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004776.dat &
wait
