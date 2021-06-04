#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0920/run007958/event007958.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007954.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0920/run007960/event007960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007959.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0920/run007961/event007961.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007959.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0921/run007962/event007962.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007959.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0921/run007963/event007963.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007959.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0921/run007965/event007965.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007964.dat &
wait
