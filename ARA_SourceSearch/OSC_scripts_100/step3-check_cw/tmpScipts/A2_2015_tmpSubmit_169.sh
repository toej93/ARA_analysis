#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0915/run006188/event006188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006184.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0915/run006190/event006190.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006189.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0916/run006191/event006191.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006189.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0916/run006192/event006192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006189.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0916/run006193/event006193.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006189.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0916/run006195/event006195.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006194.dat &
wait
date 
