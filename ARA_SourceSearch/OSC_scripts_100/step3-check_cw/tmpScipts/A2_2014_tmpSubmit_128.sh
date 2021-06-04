#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0808/run004040/event004040.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004039.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0808/run004041/event004041.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004039.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0808/run004042/event004042.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004039.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0809/run004043/event004043.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004039.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0809/run004045/event004045.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0809/run004046/event004046.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
wait
date 
