#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0714/run003906/event003906.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003903.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0714/run003907/event003907.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003903.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0714/run003909/event003909.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003908.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0715/run003910/event003910.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003908.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0715/run003911/event003911.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003908.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0715/run003912/event003912.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003908.dat &
wait
