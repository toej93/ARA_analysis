#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1003/run004319/event004319.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1003/run004321/event004321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1003/run004322/event004322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1004/run004323/event004323.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1004/run004324/event004324.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1004/run004326/event004326.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004325.dat &
wait
