#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0903/run007867/event007867.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007855.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0903/run007869/event007869.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007868.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0903/run007870/event007870.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007868.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0904/run007871/event007871.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007868.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0904/run007872/event007872.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007868.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0904/run007874/event007874.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007873.dat &
wait
