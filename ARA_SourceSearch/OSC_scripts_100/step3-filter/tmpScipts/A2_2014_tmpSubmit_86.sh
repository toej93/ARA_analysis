#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0606/run003718/event003718.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003714.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0606/run003720/event003720.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0606/run003721/event003721.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0607/run003722/event003722.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0607/run003723/event003723.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003719.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0607/run003725/event003725.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003724.dat &
wait
