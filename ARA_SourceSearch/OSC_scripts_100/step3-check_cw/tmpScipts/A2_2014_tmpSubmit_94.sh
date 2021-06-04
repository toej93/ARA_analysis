#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0618/run003779/event003779.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0619/run003780/event003780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0619/run003781/event003781.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0619/run003783/event003783.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0619/run003784/event003784.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0619/run003785/event003785.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
wait
date 
