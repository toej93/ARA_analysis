#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0507/run007218/event007218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0507/run007220/event007220.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0507/run007221/event007221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0507/run007222/event007222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0508/run007223/event007223.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007219.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0508/run007225/event007225.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007224.dat &
wait
