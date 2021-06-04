#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0504/run003523/event003523.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0504/run003524/event003524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0504/run003525/event003525.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0505/run003527/event003527.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003526.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0505/run003528/event003528.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003526.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0505/run003529/event003529.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003526.dat &
wait
