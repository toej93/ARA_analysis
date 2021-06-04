#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0110/run002869/event002869.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0111/run002870/event002870.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0111/run002871/event002871.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0111/run002873/event002873.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0112/run002875/event002875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0112/run002876/event002876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
wait
date 
