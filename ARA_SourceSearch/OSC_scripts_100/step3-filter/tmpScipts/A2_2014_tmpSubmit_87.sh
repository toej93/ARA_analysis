#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0608/run003726/event003726.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003724.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0608/run003727/event003727.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003724.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0608/run003728/event003728.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003724.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0608/run003730/event003730.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003729.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0609/run003731/event003731.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003729.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0609/run003732/event003732.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003729.dat &
wait
