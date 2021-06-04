#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0404/run003369/event003369.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003366.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0404/run003370/event003370.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003366.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0404/run003372/event003372.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003371.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0404/run003373/event003373.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003371.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0405/run003374/event003374.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003371.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0405/run003375/event003375.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003371.dat &
wait
