#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0905/run006138/event006138.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006134.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0905/run006140/event006140.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006139.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0906/run006144/event006144.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006139.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0906/run006145/event006145.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006139.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0907/run006146/event006146.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006139.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0907/run006147/event006147.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006139.dat &
wait
