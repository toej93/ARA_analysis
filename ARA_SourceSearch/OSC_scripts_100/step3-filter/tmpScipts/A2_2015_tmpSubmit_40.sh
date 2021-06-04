#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0304/run005144/event005144.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005141.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0304/run005145/event005145.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005141.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0304/run005147/event005147.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005146.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0304/run005148/event005148.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005146.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0305/run005149/event005149.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005146.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0305/run005150/event005150.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005146.dat &
wait
