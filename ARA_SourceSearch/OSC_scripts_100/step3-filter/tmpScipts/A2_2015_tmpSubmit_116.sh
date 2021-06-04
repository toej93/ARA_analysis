#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0625/run005781/event005781.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005778.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0625/run005782/event005782.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005778.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0626/run005784/event005784.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005783.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0626/run005785/event005785.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005783.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0626/run005786/event005786.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005783.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0626/run005787/event005787.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005783.dat &
wait
