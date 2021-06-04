#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0806/run004032/event004032.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0807/run004033/event004033.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0807/run004035/event004035.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004034.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0807/run004036/event004036.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004034.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0807/run004037/event004037.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004034.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0808/run004038/event004038.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004034.dat &
wait
date 
