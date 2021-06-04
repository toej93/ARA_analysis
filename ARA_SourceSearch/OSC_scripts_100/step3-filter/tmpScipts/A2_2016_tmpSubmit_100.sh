#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0704/run007537/event007537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0704/run007538/event007538.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0705/run007539/event007539.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0705/run007540/event007540.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0705/run007542/event007542.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007541.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0705/run007543/event007543.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007541.dat &
wait
