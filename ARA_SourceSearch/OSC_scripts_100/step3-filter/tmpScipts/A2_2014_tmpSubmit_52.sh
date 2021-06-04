#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0410/run003399/event003399.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003396.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0410/run003400/event003400.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003396.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0410/run003402/event003402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0410/run003403/event003403.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0411/run003404/event003404.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0411/run003405/event003405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
wait
