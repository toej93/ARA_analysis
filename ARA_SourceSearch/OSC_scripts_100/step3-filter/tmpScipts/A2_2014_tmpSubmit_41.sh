#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0324/run003313/event003313.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0324/run003315/event003315.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003314.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0324/run003316/event003316.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003314.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0324/run003317/event003317.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003314.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0325/run003318/event003318.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003314.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0325/run003320/event003320.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003319.dat &
wait
