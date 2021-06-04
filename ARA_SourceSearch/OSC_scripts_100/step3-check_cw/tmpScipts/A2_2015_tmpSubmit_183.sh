#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1006/run006293/event006293.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006289.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1007/run006295/event006295.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006294.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1007/run006296/event006296.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006294.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1007/run006297/event006297.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006294.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1007/run006298/event006298.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006294.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1008/run006300/event006300.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006299.dat &
wait
date 
