#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0620/run007471/event007471.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007467.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0620/run007473/event007473.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007472.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0621/run007474/event007474.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007472.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0621/run007475/event007475.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007472.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0621/run007476/event007476.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007472.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0621/run007478/event007478.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007477.dat &
wait
