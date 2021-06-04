#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0125/run006769/event006769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006766.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0126/run006770/event006770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006766.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0126/run006772/event006772.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0126/run006773/event006773.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0126/run006774/event006774.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006771.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0127/run006775/event006775.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006771.dat &
wait
