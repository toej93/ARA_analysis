#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1110/run004507/event004507.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004505.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1110/run004508/event004508.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004505.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1110/run004509/event004509.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004505.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1110/run004511/event004511.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004510.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1111/run004512/event004512.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004510.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1111/run004513/event004513.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004510.dat &
wait
