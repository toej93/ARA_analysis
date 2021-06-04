#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0515/run005579/event005579.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005578.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0516/run005580/event005580.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005578.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0516/run005581/event005581.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005578.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0516/run005582/event005582.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005578.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0516/run005584/event005584.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005583.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0517/run005585/event005585.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005583.dat &
wait
date 
