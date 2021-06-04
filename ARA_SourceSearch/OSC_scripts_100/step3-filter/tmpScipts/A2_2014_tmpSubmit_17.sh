#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0212/run003037/event003037.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0212/run003038/event003038.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0213/run003041/event003041.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0213/run003043/event003043.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003042.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0213/run003044/event003044.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003042.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0214/run003049/event003049.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003047.dat &
wait
