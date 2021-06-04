#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0525/run007314/event007314.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0525/run007315/event007315.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0525/run007317/event007317.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0526/run007318/event007318.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0526/run007319/event007319.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0526/run007320/event007320.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007316.dat &
wait
