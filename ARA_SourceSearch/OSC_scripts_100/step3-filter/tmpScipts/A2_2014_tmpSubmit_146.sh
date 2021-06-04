#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0909/run004201/event004201.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0909/run004202/event004202.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0909/run004203/event004203.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0910/run004204/event004204.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0910/run004206/event004206.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0910/run004207/event004207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
wait
