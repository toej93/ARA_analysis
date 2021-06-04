#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0505/run007211/event007211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0505/run007212/event007212.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0506/run007213/event007213.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0506/run007215/event007215.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0506/run007216/event007216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0506/run007217/event007217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
wait
