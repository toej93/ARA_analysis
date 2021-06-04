#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0413/run003414/event003414.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003411.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0413/run003415/event003415.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003411.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0413/run003417/event003417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0413/run003418/event003418.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0414/run003419/event003419.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0414/run003420/event003420.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003416.dat &
wait
date 
