#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1105/run006443/event006443.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006439.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1105/run006445/event006445.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006444.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1105/run006446/event006446.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006444.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1106/run006447/event006447.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006444.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1106/run006448/event006448.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006444.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1106/run006450/event006450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006449.dat &
wait
date 
