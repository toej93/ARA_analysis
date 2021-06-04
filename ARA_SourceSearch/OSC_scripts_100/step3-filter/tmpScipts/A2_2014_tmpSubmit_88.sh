#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0609/run003733/event003733.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003729.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0609/run003735/event003735.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003734.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0610/run003736/event003736.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003734.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0610/run003737/event003737.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003734.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0610/run003738/event003738.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003734.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0610/run003740/event003740.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003739.dat &
wait
