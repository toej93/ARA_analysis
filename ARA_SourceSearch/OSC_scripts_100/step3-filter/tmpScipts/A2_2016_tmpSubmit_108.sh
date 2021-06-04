#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0716/run007597/event007597.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0716/run007598/event007598.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0717/run007599/event007599.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0717/run007600/event007600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0717/run007606/event007606.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007601.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0718/run007607/event007607.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007601.dat &
wait
