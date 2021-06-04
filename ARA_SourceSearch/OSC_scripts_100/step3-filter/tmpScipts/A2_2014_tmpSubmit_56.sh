#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0416/run003429/event003429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0416/run003430/event003430.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0416/run003432/event003432.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0416/run003433/event003433.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0417/run003434/event003434.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0417/run003435/event003435.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003431.dat &
wait
