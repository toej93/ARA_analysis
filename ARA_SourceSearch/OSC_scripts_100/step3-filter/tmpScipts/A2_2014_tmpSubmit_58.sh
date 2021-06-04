#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0419/run003444/event003444.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0419/run003445/event003445.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003441.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0419/run003447/event003447.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0419/run003448/event003448.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0420/run003449/event003449.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0420/run003450/event003450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
wait
