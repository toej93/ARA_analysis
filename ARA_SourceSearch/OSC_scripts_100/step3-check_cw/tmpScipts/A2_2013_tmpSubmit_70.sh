#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2014/event2014.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2015/event2015.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2017/event2017.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2018/event2018.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2019/event2019.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2020/event2020.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
wait
date 
