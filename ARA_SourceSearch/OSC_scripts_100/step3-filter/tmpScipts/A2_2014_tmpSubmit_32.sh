#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0310/run003221/event003221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0310/run003222/event003222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0311/run003223/event003223.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0311/run003224/event003224.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0311/run003226/event003226.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003225.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0311/run003227/event003227.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003225.dat &
wait
