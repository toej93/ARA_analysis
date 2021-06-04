#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0624/run003809/event003809.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0624/run003810/event003810.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0625/run003811/event003811.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0625/run003813/event003813.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003812.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0625/run003814/event003814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003812.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0625/run003815/event003815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003812.dat &
wait
date 
