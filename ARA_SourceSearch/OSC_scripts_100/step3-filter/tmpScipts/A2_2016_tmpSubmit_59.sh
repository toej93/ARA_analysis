#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0502/run007197/event007197.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0502/run007198/event007198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0503/run007199/event007199.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0503/run007200/event007200.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0503/run007201/event007201.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0503/run007202/event007202.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
wait
