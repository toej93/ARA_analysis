#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1105/run004484/event004484.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1105/run004486/event004486.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004485.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1106/run004487/event004487.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004485.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1106/run004488/event004488.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004485.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1106/run004489/event004489.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004485.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1106/run004491/event004491.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004490.dat &
wait
date 
