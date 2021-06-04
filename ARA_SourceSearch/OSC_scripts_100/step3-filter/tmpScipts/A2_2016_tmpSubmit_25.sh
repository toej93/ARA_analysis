#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0209/run006850/event006850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0209/run006851/event006851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0210/run006852/event006852.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0210/run006853/event006853.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006849.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0210/run006855/event006855.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006854.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0210/run006856/event006856.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006854.dat &
wait
