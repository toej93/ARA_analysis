#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0419/run005444/event005444.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005443.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0419/run005445/event005445.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005443.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0419/run005446/event005446.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005443.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0420/run005447/event005447.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005443.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0420/run005449/event005449.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005448.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0420/run005450/event005450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005448.dat &
wait
date 
