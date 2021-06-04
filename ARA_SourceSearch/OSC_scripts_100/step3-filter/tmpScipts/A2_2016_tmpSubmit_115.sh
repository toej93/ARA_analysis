#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0728/run007714/event007714.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007711.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0728/run007716/event007716.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007711.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0728/run007717/event007717.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007711.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0729/run007718/event007718.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007711.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0729/run007719/event007719.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007711.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0729/run007720/event007720.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007711.dat &
wait
