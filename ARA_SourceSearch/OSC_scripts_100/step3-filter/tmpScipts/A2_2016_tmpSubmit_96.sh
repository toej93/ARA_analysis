#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0628/run007509/event007509.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0628/run007510/event007510.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0629/run007512/event007512.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0629/run007513/event007513.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0629/run007514/event007514.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0629/run007515/event007515.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007511.dat &
wait
